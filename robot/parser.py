from htravel import settings
from django.utils.timezone import pytz
from datetime import datetime
from robot.models import Country, City, Way, Route, Price


def parse_rzd_trip(data):
    local_tz = pytz.timezone(settings.TIME_ZONE)
    depart_date = datetime.strptime(data['date0'] + ' ' + data['time0'], '%d.%m.%Y %H:%M').replace(tzinfo=local_tz)
    arrive_date = datetime.strptime(data['date1'] + ' ' + data['time1'], '%d.%m.%Y %H:%M').replace(tzinfo=local_tz)

    return Route(
        # departure=local_tz.localize(depart_date),
        # arrive=local_tz.localize(arrive_date),
        departure=depart_date,
        arrive=arrive_date,
        duration=(arrive_date - depart_date),

        carrier=data.get('carrier'),
        car_description=data.get('brand'),
        route_number=data.get('number'),
    )


def parse_rzd_prices(price_list):
    for item in price_list:
        if item['typeLoc'] in ['Сидячий', 'Плацкартный', 'Купе']:
            yield {
                'price': int(item['tariff']),
                'car_class': item['typeLoc'],
                'free_seats': int(item['freeSeats']),
            }


def parse_rzd(data, way):
    try:
        trips_list = data['tp'][0]['list']
    except:
        return None

    routes_count = 0
    for data in trips_list:
        route = parse_rzd_trip(data)
        if route:
            route.way = way
            route.save()
            routes_count += 1

            for price in parse_rzd_prices(data['cars']):
                Price.objects.create(
                    route=route,
                    price=price['price'],
                    car_class=price['car_class'],
                    free_seats=price['free_seats'],
                )
    return routes_count
