from django.http import HttpResponse
from django.shortcuts import render

import robot.crawler as crawler
from robot.parser import Parser
from robot.models import Way, Route, Price


def clear_trips(request):
    Price.objects.all().delete()
    Route.objects.all().delete()
    return HttpResponse('All deleted...')


def add_test_trips(request):
    response_text = ''
    for data in crawler.get_all_dumps():
        parser = Parser(data)
        parser.parse()
        response_text += 'Saved {} ways, {} routes, {} prices <br/>'.format(
            parser.ways_count, parser.routes_count, parser.prices_count
        )

    return HttpResponse(response_text)
