from datetime import datetime
from collections import defaultdict

from robot.models import Way, Route
from django.shortcuts import render


def main(request):
    filters = {
        'from_city': 'Москва',
        'start_date': datetime(2018, 4, 14),
        'plus_days': 0,
    }

    items = defaultdict(dict)
    ways = Way.objects.all()
    Way.objects.aggregate()
    for way in ways:
        filters['way'] = way
        if way.to_city.title != 'Москва':
            items[way.to_city_id]['way'] = way
            items[way.to_city_id]['routes_head'] = Route.get('head', filters)
        else:
            items[way.from_city_id]['routes_back'] = Route.get('back', filters)

    return render(request, 'tickets.html', {
        'items': items.values()
    })
