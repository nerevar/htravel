from django.http import HttpResponse
from django.shortcuts import render

import robot.crawler as crawler
import robot.parser as parser
from robot.models import Way


def add_test_trip(request):
    data = crawler.download()
    way = Way.objects.get(type='TRAIN', from_city_id='1', to_city_id='3')
    result = parser.parse_rzd(data, way)

    return HttpResponse(str(result))

    # posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
