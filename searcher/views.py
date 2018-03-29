from datetime import datetime
from collections import defaultdict

from robot.models import Way, Route
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
            routes = Route.forward_routes.get(filters)
            items[way.to_city_id]['routes_forward'] = routes[:3]
            items[way.to_city_id]['routes_forward_count'] = len(routes)
            items[way.to_city_id]['filters'] = filters
        else:
            routes = Route.backward_routes.get(filters)
            items[way.from_city_id]['routes_backward'] = routes[:3]
            items[way.from_city_id]['routes_backward_count'] = len(routes)

    return render(request, 'index.html', {
        'items': list(items.values())
    })


def by_city(request, city_from, city_to):
    """Поезда на разные даты в конкретный город city_to"""
    ways = Way.objects.filter(
        (Q(from_city__name__exact=city_from) & Q(to_city__name__exact=city_to))
        | (Q(from_city__name__exact=city_to) & Q(to_city__name__exact=city_from))
    )
    print(city_from, city_to, ways)
    # return render(request, 'city_and_date.html', {})

    filters = {
        # 'from_city': 'Москва', # TODO
        # 'plus_days': 0, # TODO
        'forward_date_str': '14.04.2018',
    }
    filters['forward_date'] = datetime.strptime(filters['forward_date_str'], '%d.%m.%Y')

    items = defaultdict(dict)
    for way in ways:
        filters['way'] = way
        if way.to_city.title != 'Москва':
            items[way.to_city_id]['way'] = way
            routes = Route.forward_routes.get(filters)
            items[way.to_city_id]['routes_forward'] = routes
            items[way.to_city_id]['routes_forward_count'] = len(routes)
            items[way.to_city_id]['filters'] = filters
        else:
            routes = Route.backward_routes.get(filters)
            items[way.from_city_id]['routes_backward'] = routes
            items[way.from_city_id]['routes_backward_count'] = len(routes)

    return render(request, 'city.html', {
        'items': list(items.values())
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
    # return render(request, 'city_and_date.html', {})

    filters = {
        # 'from_city': 'Москва', # TODO
        # 'plus_days': 0, # TODO
        'forward_date_str': '14.04.2018',
    }
    filters['forward_date'] = datetime.strptime(filters['forward_date_str'], '%d.%m.%Y')

    items = defaultdict(dict)
    for way in ways:
        filters['way'] = way
        if way.to_city.title != 'Москва':
            items[way.to_city_id]['way'] = way
            routes = Route.forward_routes.get(filters)
            items[way.to_city_id]['routes_forward'] = routes
            items[way.to_city_id]['routes_forward_count'] = len(routes)
            items[way.to_city_id]['filters'] = filters
        else:
            routes = Route.backward_routes.get(filters)
            items[way.from_city_id]['routes_backward'] = routes
            items[way.from_city_id]['routes_backward_count'] = len(routes)

    return render(request, 'city_and_date.html', {
        'items': list(items.values())
    })
