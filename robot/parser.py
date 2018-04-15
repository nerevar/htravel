import re
import base64
import logging
import itertools

from django.utils.timezone import pytz
from datetime import datetime, timedelta

from htravel import settings
from robot.models import City, Way, Route, Train
from robot.helpers import parse_rzd_timestamp

LOCAL_TZ = pytz.timezone(settings.TIME_ZONE)
logger = logging.getLogger(__name__)
DEFAULT_MIN_PRICE = 999999


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

    def __init__(self, data):
        self.json_dump = data

    @staticmethod
    def parse_way(way_data):
        try:
            city_from = City.objects.get(title=way_data['from'])
            city_to = City.objects.get(title=way_data['where'])
            way = Way.objects.get(city_from=city_from, city_to=city_to)
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

    def parse(self):
        """парсит json_dump от ржд, yield'ит маршруты Routes - туда и обратно"""
        all_routes = []
        request_date = parse_rzd_timestamp(self.json_dump['timestamp'])
        for way_data in self.json_dump['tp']:
            way = self.parse_way(way_data)
            if not way:
                continue
            self.ways_count += 1

            for route_data in way_data['list']:
                route = self.parse_route(route_data)
                if not route:
                    continue

                # TODO: фильтрация, на основе route и цен
                min_price = DEFAULT_MIN_PRICE
                for price_data in route_data['cars']:
                    if price_data['typeLoc'] == 'Купе':
                        route.price_coupe = int(price_data['tariff'])
                        route.seats_coupe = int(price_data['freeSeats'])
                        min_price = min(min_price, route.price_coupe)
                    if price_data['typeLoc'] == 'Плацкартный':
                        route.price_platzkart = int(price_data['tariff'])
                        route.seats_platzkart = int(price_data['freeSeats'])
                        min_price = min(min_price, route.price_platzkart)
                    if price_data['typeLoc'] == 'Сидячий':
                        route.price_seated = int(price_data['tariff'])
                        route.seats_seated = int(price_data['freeSeats'])
                        if route.duration <= timedelta(hours=4, minutes=30):
                            min_price = min(min_price, route.price_seated)

                # TODO: логировать количество билетов, не прошедших фильтр
                if min_price != DEFAULT_MIN_PRICE:
                    route.min_price = min_price
                    route.way = way
                    route.request_date = request_date
                    all_routes.append(route)
                    self.routes_count += 1

        for way, routes in itertools.groupby(all_routes, key=lambda x: x.way):
            yield way, routes


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
