from datetime import datetime
from robot.models import Way, Route
from django.shortcuts import render


def main(request):
    items = []
    ways = Way.objects.all()
    for way in ways:
        # TODO: склеивать билеты обратно
        if way.to_city.title == 'Москва':
            continue

        routes = Route \
            .get_by_date(datetime(2018, 4, 14)) \
            .filter(way=way)

        items.append({
            'way': way,
            'routes': routes
        })

    return render(request, 'tickets.html', {
        'items': items
    })
