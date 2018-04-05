from datetime import datetime, timedelta

from robot.models import Way, Route, City, LOCAL_TZ
from django.shortcuts import render
from dateutil.relativedelta import relativedelta, SA


def main(request):
    """главная страница"""
    next_saturday = datetime.now().astimezone(LOCAL_TZ) + relativedelta(weekday=SA(1))
    date_start = next_saturday.strftime('%d.%m.%Y')
    trips = list(Route.trips.get_trips({'city_from': 'moscow', 'date_to_str': date_start}))

    return render(request, 'index.html', {
        'date_to_str': date_start,
        'type': 'index',
        'trips': trips,

        'next_saturday': (next_saturday + timedelta(days=7)).strftime('%d.%m.%Y'),
        'city_spb': City.objects.get(name__exact='spb'),
        'city_kazan': City.objects.get(name__exact='kazan'),
    })


def by_city(request, city_from, city_to):
    """Поезда в конкретный город на разные даты"""
    way_to = Way.objects.get(from_city__name__exact=city_from, to_city__name__exact=city_to)
    way_from = Way.objects.get(from_city__name__exact=city_to, to_city__name__exact=city_from)

    trips = list(Route.trips.get_trips({'way_to': way_to, 'way_from': way_from}))

    return render(request, 'by_city.html', {
        'type': 'by_city',
        'way_to': way_to,
        'way_from': way_from,
        'trips': trips
    })


def by_date(request, date_start):
    """Поезда на конкретную дату date в разные города"""
    # TODO: escape date_to_str
    trips = Route.trips.get_trips({'date_to_str': date_start})

    return render(request, 'by_date.html', {
        'type': 'by_date',
        'date_to_str': date_start,
        'trips': list(trips)
    })


def by_city_and_date(request, city_from, city_to, date_start):
    """Поезда в конкретный город city_to на конкретную дату date"""
    # TODO: 404 страница
    way_to = Way.objects.get(from_city__name__exact=city_from, to_city__name__exact=city_to)
    way_from = Way.objects.get(from_city__name__exact=city_to, to_city__name__exact=city_from)

    trips = Route.trips.get_trips({'way_to': way_to, 'way_from': way_from, 'date_to_str': date_start})

    return render(request, 'by_city_and_date.html', {
        'type': 'by_city_and_date',
        'way_to': way_to,
        'way_from': way_from,
        'trip': list(trips)[0]
    })
