from datetime import datetime


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
