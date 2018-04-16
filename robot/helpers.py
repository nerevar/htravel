from datetime import datetime
from dateutil.relativedelta import relativedelta, SA

from django.utils.timezone import pytz

from htravel import settings

LOCAL_TZ = pytz.timezone(settings.TIME_ZONE)


class TimeRange:
    def __init__(self, s1, s2, tz, strict=False):
        self.t1 = tz.localize(datetime.strptime(s1, '%H:%M')).time()
        self.t2 = tz.localize(datetime.strptime(s2, '%H:%M')).time()
        self.tz = tz
        self.strict = strict

    def __contains__(self, dt):
        if self.strict:
            return self.t1 < dt.astimezone(self.tz).time() < self.t2
        else:
            return self.t1 <= dt.astimezone(self.tz).time() <= self.t2


def parse_rzd_timestamp(date_str):
    return LOCAL_TZ.localize(datetime.strptime(date_str, '%d.%m.%Y %H:%M:%S.%f'))


def get_next_saturday(from_date=None, direction=1):
    if from_date is None:
        from_date = datetime.now()
    return from_date.astimezone(LOCAL_TZ) + relativedelta(weekday=SA(direction))
