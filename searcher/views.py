from datetime import datetime
from collections import defaultdict

from robot.models import Way, Route
from django.shortcuts import render


def main(request):
    filters = {
        'from_city': 'Москва',
        'forward_date': datetime(2018, 4, 14),
        'plus_days': 0,
    }

    items = defaultdict(dict)
    ways = Way.objects.all()
    for way in ways:
        filters['way'] = way
        if way.to_city.title != 'Москва':
            items[way.to_city_id]['way'] = way
            items[way.to_city_id]['routes_forward'] = Route.forward_routes.get(filters)
        else:
            items[way.from_city_id]['routes_backward'] = Route.backward_routes.get(filters)

    return render(request, 'tickets.html', {
        'items': items.values()
    })
