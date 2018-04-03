import re
import base64
import logging

from django.utils.timezone import pytz
from datetime import datetime, timedelta

from htravel import settings
from robot.models import Country, City, Way, Route, Price, Train

LOCAL_TZ = pytz.timezone(settings.TIME_ZONE)
logger = logging.getLogger(__name__)


class RzdParser:
    """
    RzdParser:
    - принять на вход json_dump
    - для каждого "сегмента" получить Way
    - распарсить в каждом сегменте все Route, создать инстансы
    - фильтрация только хороших билетов с местами и ценами - Filter service
    - в базу сохранить только хорошие
    """
    ways_count = 0
    routes_count = 0
    prices_count = 0

    def __init__(self, data):
        self.json_dump = data

    @staticmethod
    def parse_way(way_data):
        try:
            from_city = City.objects.get(title=way_data['from'])
            to_city = City.objects.get(title=way_data['where'])
            way = Way.objects.get(from_city=from_city, to_city=to_city)
        except:
            return None
        return way

    @staticmethod
    def parse_route(route_data):
        depart_date = datetime.strptime(
            route_data['date0'] + ' ' + route_data['time0'],
            '%d.%m.%Y %H:%M'
        )
        arrive_date = datetime.strptime(
            route_data['date1'] + ' ' + route_data['time1'],
            '%d.%m.%Y %H:%M'
        )
        train_number = route_data.get('number')

        try:
            train = Train.objects.get(number=train_number)
        except:
            logger.warning(
                'Error parse rzd, train_number {train_number} not found'.format(
                    train_number=train_number,
                ))

            return None

        return Route(
            departure=LOCAL_TZ.localize(depart_date),
            departure_time=LOCAL_TZ.localize(depart_date).time(),
            arrive=LOCAL_TZ.localize(arrive_date),
            duration=(arrive_date - depart_date),
            train=train
        )

    @staticmethod
    def parse_price(price_data):
        if price_data['typeLoc'] in ['Сидячий', 'Плацкартный', 'Купе']:
            return Price(
                price=int(price_data['tariff']),
                car_class=price_data['typeLoc'],
                free_seats=int(price_data['freeSeats']),
            )
        return None

    def parse(self):
        for way_data in self.json_dump['tp']:
            way = self.parse_way(way_data)
            if not way:
                continue
            self.ways_count += 1

            for route_data in way_data['list']:
                route = self.parse_route(route_data)
                if not route:
                    continue

                route.way = way
                route.save()
                self.routes_count += 1

                # TODO: фильтрация, на основе route и цен
                min_price = None
                for price_data in route_data['cars']:
                    price = self.parse_price(price_data)
                    if not price:
                        continue

                    if price.car_class != 'Сидячий' or route.duration <= timedelta(hours=4, minutes=30) \
                            and (min_price is None or price.price < min_price):
                        min_price = price.price
                    price.route = route
                    price.save()
                    self.prices_count += 1

                if min_price:
                    route.min_price = min_price
                    route.save()


class TuturuTrainsParser:
    def __init__(self, data, way):
        self.json_dump = data
        self.way = way

    def parse(self):
        if not len(self.json_dump.get('trips', [])):
            return None

        trains_count = 0
        for train_data in self.json_dump['trips']:
            train_number = re.sub(r'[^\dа-яА-Яa-zA-Z]', '', train_data.get('trainNumber'), re.UNICODE)
            tuturu_id = train_data.get('numberForUrl')
            train_number_encoded = base64.b64encode(train_number.encode()).decode('utf-8')
            if tuturu_id != train_number_encoded:
                logger.warning('Error base64 encode tutu.ru train: number - `{train_number}` (`{train_number_raw}`), tuturu_id - `{tuturu_id}`, encoded - `{encoded}`, decoded - `{decoded_tuturu}`'.format(
                    train_number=train_number,
                    train_number_raw=train_data.get('trainNumber'),
                    tuturu_id=tuturu_id,
                    encoded=train_number_encoded,
                    decoded_tuturu=base64.b64decode(tuturu_id.encode()).decode('utf-8')
                ))
            train, created = Train.objects.get_or_create(
                number=train_number,
                defaults={
                    'way': self.way,
                    'name': (train_data.get('name') or None),
                    'is_firm': train_data.get('firm', False),
                    'tuturu_id': tuturu_id
                }
            )
            trains_count += int(created)
        return trains_count
