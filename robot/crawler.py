import os
import time
import json
import logging
import requests
from datetime import datetime

DUMPS_FOLDER = './robot/dumps/rzd/'
TUTURU_TRAINS_FOLDER = './robot/dumps/tutu.ru/trains'

logger = logging.getLogger(__name__)


def get_all_tuturu_dump_files():
    for filename in os.listdir(TUTURU_TRAINS_FOLDER):
        yield filename


def download_tuturu_trains(way):
    filename = os.path.join(TUTURU_TRAINS_FOLDER, '{}-{}.json'.format(way.from_city.name, way.to_city.name))
    url = 'https://www.tutu.ru/poezda/api/travelpayouts/?departureStation={}&arrivalStation={}'.format(
        way.from_city.rzd_code, way.to_city.rzd_code
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
    for trips in os.listdir(DUMPS_FOLDER):
        if not os.path.isdir(os.path.join(DUMPS_FOLDER, trips)):
            continue
        for date in os.listdir(os.path.join(DUMPS_FOLDER, trips)):
            json_files = os.listdir(os.path.join(DUMPS_FOLDER, trips, date))
            paths = [os.path.join(DUMPS_FOLDER, trips, date, basename) for basename in json_files]
            yield max(paths, key=os.path.getctime)


class Crawler:
    base_url = 'https://pass.rzd.ru/timetable/public/ru?STRUCTURE_ID=735&layer_id=5371'

    def __init__(self, way, date_from, date_to):
        self.way = way
        self.date_from = date_from
        self.date_to = date_to
        self.data = None
        self.request_date = None

    def download(self, delay=5):
        # TODO: retry failded downloads
        # скачивает с rzd, возвращает json
        params = '&dir=1&tfl=1&checkSeats=1'
        params += '&code0={code_from}&dt0={date_from}&code1={code_to}&dt1={date_to}'.format(
            code_from=self.way.from_city.rzd_code,
            code_to=self.way.to_city.rzd_code,
            date_from=self.date_from.strftime('%d.%m.%Y'),
            date_to=self.date_to.strftime('%d.%m.%Y'),
        )

        r = requests.post(self.base_url + params)
        rid = r.json()['rid']

        time.sleep(delay)

        params = '&rid={}'.format(rid)
        r = requests.post(self.base_url + params, cookies=r.cookies)

        self.data = r.json()
        self.request_date = datetime.now()

        return self.data

    def save_to_file(self):
        filename = './robot/dumps/rzd/{city_from}-{city_to}/{date_from}/{date_from}-{city_from}-{city_to}-{request_date}.json'.format(
            date_from=self.date_from.strftime('%Y-%m-%d'),
            request_date=self.request_date.strftime('%Y-%m-%d--%H-%M-%S-%f'),
            city_from=self.way.from_city.name,
            city_to=self.way.to_city.name,
        )
        os.makedirs(os.path.dirname(filename), exist_ok=True)

        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(self.data, f, indent=4, ensure_ascii=False)
