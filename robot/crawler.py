import json


def download():
    with open('./robot/dumps/rzd/2018-02-24_23-11-01-090445.json') as f:
        return json.load(f)


def get_all_dumps():
    files = [
        '18-04-12-16-rzd-led.json', '18-04-13-15-rzd-led.json',
        '18-04-12-16-rzd-kzn.json', '18-04-13-15-rzd-kzn.json',
    ]
    for filename in files:
        with open('./robot/dumps/rzd/{}'.format(filename)) as f:
            yield json.load(f)
