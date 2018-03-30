from datetime import datetime, timedelta
from collections import defaultdict

from robot.models import Way, Route, LOCAL_TZ
from django.shortcuts import render

from django.db.models import Q


def main(request):
    """главная страница"""
    filters = {
        # 'from_city': 'Москва', # TODO
        # 'plus_days': 0, # TODO
        'forward_date_str': '14.04.2018',
    }
    filters['forward_date'] = datetime.strptime(filters['forward_date_str'], '%d.%m.%Y')

    ways = Way.objects.all()
    items = defaultdict(dict)
    for way in ways:
        filters['way'] = way
        if way.to_city.title != 'Москва':
            items[way.to_city_id]['way'] = way
            routes = Route.forward_routes.get_by_city_and_date(filters)
            items[way.to_city_id]['routes_forward'] = routes[:3]
            items[way.to_city_id]['routes_forward_count'] = len(routes)
            items[way.to_city_id]['filters'] = filters
        else:
            routes = Route.backward_routes.get_by_city_and_date(filters)
            items[way.from_city_id]['routes_backward'] = routes[:3]
            items[way.from_city_id]['routes_backward_count'] = len(routes)

    return render(request, 'index.html', {
        'items': list(items.values())
    })


def by_city(request, city_from, city_to):
    way_to = Way.objects.get(from_city__name__exact=city_from, to_city__name__exact=city_to)
    way_from = Way.objects.get(from_city__name__exact=city_to, to_city__name__exact=city_from)

    trips = Route.trips.get_trips({'way_to': way_to, 'way_from': way_from, })

    return render(request, 'by_city.html', {
        'way_to': way_to,
        'way_from': way_from,
        'trips': list(trips)
    })


def by_date(request, date_start):
    """Поезда на конкретную дату date в разные города"""
    filters = {
        # 'from_city': 'Москва', # TODO
        # 'plus_days': 0, # TODO
        'forward_date_str': date_start,
    }
    filters['forward_date'] = datetime.strptime(filters['forward_date_str'], '%d.%m.%Y')

    items = defaultdict(dict)
    for routes in Route.forward_routes.get_by_date(filters):
        city = routes[0].way.to_city_id
        items[city]['to'] = {}
        items[city]['to']['way'] = routes[0].way
        items[city]['to']['routes'] = routes[:3]
        items[city]['to']['routes_count'] = len(routes)
        items[city]['to']['filters'] = filters

    for routes in Route.backward_routes.get_by_date(filters):
        city = routes[0].way.from_city_id
        items[city]['from'] = {}
        items[city]['from']['way'] = routes[0].way
        items[city]['from']['routes'] = routes[:3]
        items[city]['from']['routes_count'] = len(routes)
        items[city]['from']['filters'] = filters

    return render(request, 'by_date.html', {
        'groups': list(items.values())
    })


def by_city_and_date(request, city_from, city_to, date):
    """Поезда в конкретный город city_to на конкретную дату date"""
    # TODO: 404 страница
    # TODO: перенести в модель
    ways = Way.objects.filter(
        (Q(from_city__name__exact=city_from) & Q(to_city__name__exact=city_to))
        | (Q(from_city__name__exact=city_to) & Q(to_city__name__exact=city_from))
    )
    print(city_from, city_to, date, ways)
    # return render(request, 'by_city_and_date.html', {})

    filters = {
        # 'from_city': 'Москва', # TODO
        # 'plus_days': 0, # TODO
        'forward_date_str': date,
    }
    filters['forward_date'] = datetime.strptime(filters['forward_date_str'], '%d.%m.%Y')

    items = defaultdict(dict)
    for way in ways:
        filters['way'] = way
        if way.to_city.title != 'Москва':
            items[way.to_city_id]['way'] = way
            routes = Route.forward_routes.get_by_city_and_date(filters)
            items[way.to_city_id]['routes_forward'] = routes
            items[way.to_city_id]['routes_forward_count'] = len(routes)
            items[way.to_city_id]['filters'] = filters
        else:
            routes = Route.backward_routes.get_by_city_and_date(filters)
            items[way.from_city_id]['routes_backward'] = routes
            items[way.from_city_id]['routes_backward_count'] = len(routes)

    return render(request, 'by_city_and_date.html', {
        'items': list(items.values())
    })
