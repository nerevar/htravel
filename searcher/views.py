from django.shortcuts import render
from robot.models import Way, Route


def main(request):
    way = Way.objects.get(type='TRAIN', from_city_id='1', to_city_id='3')
    routes = Route.objects.filter(way=way)
    return render(request, 'tickets.html', {
        'way': way,
        'routes': routes
    })
