import json


def download():
    with open('./robot/dumps/rzd/2018-02-24_23-11-01-090445.json') as f:
        return json.load(f)
