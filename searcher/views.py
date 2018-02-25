from django.shortcuts import render
from robot.models import Way, Route


def main(request):
    way = Way.objects.get(type='TRAIN', from_city_id='1', to_city_id='3')
    return render(request, './main.html', {})
