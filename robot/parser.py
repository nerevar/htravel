from htravel import settings
from django.utils.timezone import pytz
from datetime import datetime, timedelta
from robot.models import Country, City, Way, Route, Price

# Parser:
# - принять на вход json_dump
# - для каждого "сегмента" получить Way
# - распарсить в каждом сегменте все Route, создать инстансы
# - фильтрация только хороших билетов с местами и ценами - Filter service
# - в базу сохранить только хорошие

LOCAL_TZ = pytz.timezone(settings.TIME_ZONE)


class Parser:
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

        return Route(
            departure=LOCAL_TZ.localize(depart_date),
            arrive=LOCAL_TZ.localize(arrive_date),
            duration=(arrive_date - depart_date),

            carrier=route_data.get('carrier'),
            car_description=route_data.get('brand'),
            route_number=route_data.get('number'),
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
