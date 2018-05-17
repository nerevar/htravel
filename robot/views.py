import json
import logging
from datetime import datetime, timedelta

from django.http import HttpResponse
from django.shortcuts import render

from robot.crawler import RzdTrainsCrawler
import robot.crawler as crawler
from robot.updater import Updater
from robot.parser import RzdParser, TuturuTrainsParser
from robot.models import Way, Route, RouteArchive, Trip

logger = logging.getLogger(__name__)


def download_all_tuturu_trains(request):
    """скачивает недостающие json-дампы с номерами поездов tutu.ru"""
    current_ways = [x.replace('.json', '').split('-') for x in crawler.get_all_tuturu_dump_files()]
    # logger.info('download_all_tuturu_trains, current_ways: {}'.format(current_ways))
    for new_trip in Trip.trips.get_except(current_ways):
        crawler.download_tuturu_trains(new_trip.way_to)
        crawler.download_tuturu_trains(new_trip.way_from)
    return HttpResponse('ok')


def parse_tuturu_trains(request):
    response_text = ''
    for filename in crawler.get_all_tuturu_dump_files():
        parser = TuturuTrainsParser(filename)
        trains_count = parser.parse()
        response_text += '{} new trains from tutu.ru added: {}<br/>\n'.format(trains_count, filename)
        logger.info('parse_tuturu_trains, {} new trains from tutu.ru added: {}<br/>\n'.format(trains_count, filename))

    return HttpResponse(response_text)


def clear_trips(request):
    Route.objects.all().delete()
    RouteArchive.objects.all().delete()
    return HttpResponse('All deleted...')


def add_test_one_trip(request):
    response_text = ''
    for filename in ['./robot/dumps/rzd/moscow.old/spb/2018-04-20-2018-04-22/2018-04-05--11-27-46-752017.json']:
        with open(filename) as f:
            data = json.load(f)
        trip = Trip.trips.get_by_cities('moscow', 'spb')
        parser = RzdParser(data, trip)

        for way, routes in parser.parse():
            Updater(routes).add()

        response_text += 'Saved {} ways, {} routes from file: {} <br/>'.format(
            parser.ways_count, parser.routes_count, filename
        )

    return HttpResponse(response_text)


def add_test_second_trip(request):
    response_text = ''
    for filename in ['./robot/dumps/rzd/moscow/spb/2018-04-20-2018-04-22/2018-04-09--11-13-52-044707.json']:
        with open(filename) as f:
            data = json.load(f)
        trip = Trip.trips.get_by_cities('moscow', 'spb')
        parser = RzdParser(data, trip)

        for way, routes in parser.parse():
            Updater(routes).update()

        response_text += 'Saved {} ways, {} routes from file: {} <br/>'.format(
            parser.ways_count, parser.routes_count, filename
        )

    return HttpResponse(response_text)


def add_test_trips(request):
    # TODO: починить
    response_text = ''
    for filename in crawler.get_latest_dumps():
        with open(filename) as f:
            data = json.load(f)
        parser = RzdParser(data)
        for way, routes in parser.parse():
            Updater(routes).add()

        response_text += 'Saved {} ways, {} routes from file: {} <br/>'.format(
            parser.ways_count, parser.routes_count, filename
        )

    return HttpResponse(response_text)


def download_test_routes(request):
    # TODO: починить
    response_text = ''
    way = Way.filtered.get_by_cities('moscow', 'spb')

    c = RzdTrainsCrawler(way, datetime(2018, 4, 20), datetime(2018, 4, 22))
    data = c.download()
    c.save_to_file()
    c.save_to_db()

    parser = RzdParser(data)
    for way, routes in parser.parse():
        Updater(routes).add()

    response_text += 'Saved {} ways, {} routes <br/>'.format(
        parser.ways_count, parser.routes_count
    )

    return HttpResponse(response_text)
    # return HttpResponse('Downloaded {} + {} routes'.format(len(data['tp'][0]), data['tp'][1]))


def download_april_may(request):
    # TODO: починить
    response_text = ''
    for city_from, city_to in [('moscow', 'spb'), ('moscow', 'kazan')]:
        way = Way.filtered.get_by_cities(city_from, city_to)

        start_date = datetime(2018, 4, 6)
        for i in range(8):
            c = RzdTrainsCrawler(way, start_date, start_date + timedelta(days=2))
            data = c.download()
            c.save_to_file()
            if 'tp' in data and len(data['tp']):
                response_text += '{} downloaded ok: {} ways'.format(start_date, len(data['tp']))
            else:
                response_text += '{} download fail {}'.format(start_date, data)
            start_date += timedelta(days=7)

    return HttpResponse(response_text)
