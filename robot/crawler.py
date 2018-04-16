import os
import time
import json
import logging
import requests
from datetime import datetime, timedelta

from django.utils.timezone import pytz

from htravel import settings
from robot.models import JsonDump, Trip
from robot.helpers import parse_rzd_timestamp, get_next_saturday

LOCAL_TZ = pytz.timezone(settings.TIME_ZONE)
DUMPS_FOLDER = './robot/dumps/rzd/'
TUTURU_TRAINS_FOLDER = './robot/dumps/tutu.ru/trains'

logger = logging.getLogger(__name__)


def get_all_tuturu_dump_files():
    for filename in os.listdir(TUTURU_TRAINS_FOLDER):
        yield filename


def download_tuturu_trains(way):
    filename = os.path.join(TUTURU_TRAINS_FOLDER, '{}-{}.json'.format(way.city_from.name, way.city_to.name))
    url = 'https://www.tutu.ru/poezda/api/travelpayouts/?departureStation={}&arrivalStation={}'.format(
        way.city_from.rzd_code, way.city_to.rzd_code
    )
    r = requests.get(url)
    data = r.json()

    logger.info('download_all_tuturu_trains, got {} trains from way: {}'.format(len(data['trips']), way))

    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4, ensure_ascii=False)


def download():
    with open('./robot/dumps/rzd/2018-02-24_23-11-01-090445.json') as f:
        return json.load(f)


def get_latest_dumps():
    for city_from in os.listdir(DUMPS_FOLDER):
        if not os.path.isdir(os.path.join(DUMPS_FOLDER, city_from)):
            continue
        for city_to in os.listdir(os.path.join(DUMPS_FOLDER, city_from)):
            for date in os.listdir(os.path.join(DUMPS_FOLDER, city_from, city_to)):
                json_files = os.listdir(os.path.join(DUMPS_FOLDER, city_from, city_to, date))
                paths = [os.path.join(DUMPS_FOLDER, city_from, city_to, date, basename) for basename in json_files]
                yield max(paths, key=os.path.getctime)


class RzdTrainsCrawler:
    base_url = 'https://pass.rzd.ru/timetable/public/ru?STRUCTURE_ID=735&layer_id=5371'

    def __init__(self, trip, date_to, date_from):
        self.trip = trip
        self.date_to = date_to
        self.date_from = date_from
        self.json_dump = None
        self.request_date = None

    def download(self, delay=5):
        """скачивает с rzd, возвращает json"""
        # TODO: retry failded downloads
        params = '&dir=1&tfl=1&checkSeats=1'
        params += '&code0={code_from}&dt0={date_to}&code1={code_to}&dt1={date_from}'.format(
            code_from=self.trip.city_from.rzd_code,
            code_to=self.trip.city_to.rzd_code,
            date_from=self.date_from.strftime('%d.%m.%Y'),
            date_to=self.date_to.strftime('%d.%m.%Y'),
        )

        r = requests.post(self.base_url + params)
        rid = r.json()['rid']

        time.sleep(delay)

        params = '&rid={}'.format(rid)
        r = requests.post(self.base_url + params, cookies=r.cookies)

        self.json_dump = r.json()
        self.request_date = parse_rzd_timestamp(self.json_dump['timestamp'])

        logger.info('downloaded rzd train: {}, {} - {}'.format(self.trip, self.date_to, self.date_from))

        return self.json_dump

    def get_dump_filename(self):
        return os.path.join(DUMPS_FOLDER, '{city_from}/{city_to}/{date_to}-{date_from}/{request_date}.json'.format(
            city_from=self.trip.city_from.name,
            city_to=self.trip.city_to.name,
            date_to=self.date_to.strftime('%Y-%m-%d'),
            date_from=self.date_from.strftime('%Y-%m-%d'),
            request_date=self.request_date.strftime('%Y-%m-%d--%H-%M-%S-%f'),
        ))

    def save_to_file(self):
        filename = self.get_dump_filename()
        os.makedirs(os.path.dirname(filename), exist_ok=True)

        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(self.json_dump, f, indent=4, ensure_ascii=False)

    def save_to_db(self):
        trains = self.json_dump.get('tp', [])
        trains_to_count = len(trains[0]['list']) if len(trains) >= 1 else 0
        trains_from_count = len(trains[1]['list']) if len(trains) == 2 else 0

        return JsonDump.objects.create(
            request_date=self.request_date,
            trip=self.trip,
            status='downloaded',
            date_to=self.date_to,
            date_from=self.date_from,
            filename=self.get_dump_filename(),
            trains_to_count=trains_to_count,
            trains_from_count=trains_from_count
        )


def download_rzd_trains(max_days_range=8, download_delay=6):
    """
    Скачивает все поезда по всем Путешествиям `Trips`
    :param max_days_range: — диапазон дней, за сколько брать новые поезда для обновления
    :param download_delay: - не перекачивать, если со времени последнего дампа прошло менее `download_delay` часов
    :return: JsonDump[] — возвращает итератор скачанных дампов `JsonDump`
    """

    # TODO: logging
    last_day = datetime.now().date() + timedelta(days=max_days_range)
    print('Data range: {} - {}'.format(datetime.now().date(), last_day))

    for trip in Trip.objects.all():
        print(str(trip))
        saturday = get_next_saturday().date()
        while saturday <= last_day:
            friday = saturday - timedelta(days=1)
            sunday = saturday + timedelta(days=1)
            if sunday >= last_day:
                break

            # TODO: не скачивать, если в базе уже есть свежий JsonDump download_delay
            # TODO: bulletproof -> не падать, если не скачалось

            print('    ' + str(saturday), end=' ')
            c = RzdTrainsCrawler(trip, friday, sunday)
            data = c.download()

            if 'tp' in data and len(data['tp']) == 2:
                print('TO: {} -> {} ways'.format(friday, len(data['tp'][0]['list'])), end='; ')
                print('FROM: {} -> {} ways'.format(sunday, len(data['tp'][1]['list'])))
                c.save_to_file()
                yield c.save_to_db()
            else:
                print('Error download: {}'.format(data))

            saturday += timedelta(days=7)
