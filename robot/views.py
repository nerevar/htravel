import json
from datetime import datetime

from django.http import HttpResponse
from django.shortcuts import render

from robot.crawler import Crawler
import robot.crawler as crawler
from robot.parser import Parser
from robot.models import Way, Route, Price

# ключевые поля маршрута:
# way_id, route_number, departure (day)


def clear_trips(request):
    Price.objects.all().delete()
    Route.objects.all().delete()
    return HttpResponse('All deleted...')


def add_test_trips(request):
    response_text = ''
    for filename in crawler.get_latest_dumps():
        with open(filename) as f:
            data = json.load(f)
        parser = Parser(data)
        parser.parse()
        response_text += 'Saved {} ways, {} routes, {} prices from file: {} <br/>'.format(
            parser.ways_count, parser.routes_count, parser.prices_count, filename
        )

    return HttpResponse(response_text)


def download_test_routes(request):
    response_text = ''
    way = Way.objects.get(
        from_city__name__exact='moscow',
        to_city__name__exact='spb',
    )

    # print(way)
    # print(way.to_city.name)
    c = Crawler(way, datetime(2018, 4, 20), datetime(2018, 4, 22))
    data = c.download()
    c.save_to_file()

    parser = Parser(data)
    parser.parse()
    response_text += 'Saved {} ways, {} routes, {} prices <br/>'.format(
        parser.ways_count, parser.routes_count, parser.prices_count
    )

    return HttpResponse(response_text)
    # return HttpResponse('Downloaded {} + {} routes'.format(len(data['tp'][0]), data['tp'][1]))
