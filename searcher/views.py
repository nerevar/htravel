from datetime import datetime, timedelta

from django.shortcuts import render

from robot.models import City, Trip
from robot.helpers import get_next_saturday


def main(request):
    """главная страница"""
    next_saturday = get_next_saturday()

    trips = list(Trip.trips.get({
        'city_from': City.objects.get(name__exact='moscow'),
        'date_to': next_saturday
    }))

    return render(request, 'index.html', {
        'date_to_str': next_saturday.strftime('%d.%m.%Y'),
        'page': 'index',
        'trips': trips,

        'next_saturday': (next_saturday + timedelta(days=7)).strftime('%d.%m.%Y'),
        'city_spb': City.objects.get(name__exact='spb'),
        'city_kazan': City.objects.get(name__exact='kazan'),
    })


def by_city(request, city_from, city_to):
    """Поезда в конкретный город на разные даты"""
    next_saturday = get_next_saturday()
    trips = list(Trip.trips.get({
        'city_from': City.objects.get(name__exact=city_from),
        'city_to': City.objects.get(name__exact=city_to)
    }))

    return render(request, 'by_city.html', {
        'page': 'by_city',
        'trips': trips,

        'next_saturday': (next_saturday + timedelta(days=7)).strftime('%d.%m.%Y'),
        'city_spb': City.objects.get(name__exact='spb'),
        'city_kazan': City.objects.get(name__exact='kazan'),
    })


def by_date(request, date_start):
    """Поезда на конкретную дату date в разные города"""
    # TODO: escape date_to_str
    date_to = datetime.strptime(date_start, '%d.%m.%Y')
    next_saturday = get_next_saturday()

    trips = list(Trip.trips.get({
        'city_from': City.objects.get(name__exact='moscow'),
        'date_to': date_to
    }))

    return render(request, 'by_date.html', {
        'page': 'by_date',
        'date_to_str': date_start,
        'trips': trips,

        'next_saturday': (next_saturday + timedelta(days=7)).strftime('%d.%m.%Y'),
        'city_spb': City.objects.get(name__exact='spb'),
        'city_kazan': City.objects.get(name__exact='kazan'),
    })


def by_city_and_date(request, city_from, city_to, date_start):
    """Поезда в конкретный город city_to на конкретную дату date"""
    # TODO: 404 страница
    date_to = datetime.strptime(date_start, '%d.%m.%Y')
    next_saturday = get_next_saturday()

    trips = list(Trip.trips.get({
        'city_from': City.objects.get(name__exact=city_from),
        'city_to': City.objects.get(name__exact=city_to),
        'date_to': date_to
    }))

    return render(request, 'by_city_and_date.html', {
        'page': 'by_city_and_date',
        'trip': trips[0],

        'next_saturday': (next_saturday + timedelta(days=7)).strftime('%d.%m.%Y'),
        'city_spb': City.objects.get(name__exact='spb'),
        'city_kazan': City.objects.get(name__exact='kazan'),
    })
