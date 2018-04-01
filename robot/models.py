import operator
import itertools
from functools import reduce
from collections import defaultdict
from datetime import timedelta, datetime, time
from dateutil.relativedelta import relativedelta, SA

from django.utils.timezone import pytz, is_aware
from django.db import models
from django.db.models import Q

from htravel import settings
from robot.helpers import TimeRange
from searcher.helpers import get_date_to

ROUTES_COUNT = 5
LOCAL_TZ = pytz.timezone(settings.TIME_ZONE)


class Country(models.Model):
    title = models.CharField(max_length=50)
    code = models.CharField(max_length=10)

    def __str__(self):
        return self.title


class City(models.Model):
    title = models.CharField(max_length=50)
    name = models.CharField(max_length=50)
    descr = models.TextField(null=True, blank=True, default=None)
    iata_code = models.CharField(max_length=3, blank=True, null=True, default=None, verbose_name='Код аэропорта ИАТА')
    rzd_code = models.CharField(max_length=10, blank=True, null=True, default=None, verbose_name='Код ж/д станции')
    country = models.ForeignKey('Country', on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.title


class Way(models.Model):
    route_types = {
        ('TRAIN', 'Train'),
        ('PLANE', 'Airplane'),
    }
    type = models.CharField(max_length=5, choices=route_types, default='TRAIN')
    from_city = models.ForeignKey('City', on_delete=models.SET_NULL, null=True, related_name='from_city')
    to_city = models.ForeignKey('City', on_delete=models.SET_NULL, null=True, related_name='to_city')

    def __str__(self):
        return '{}: {} - {}'.format(self.type, self.from_city, self.to_city)


class TripsManager(models.Manager):
    @staticmethod
    def get_departure_to_filter(date_to_str):
        date_to = datetime.strptime(date_to_str, '%d.%m.%Y')
        departure_from = datetime(date_to.year, date_to.month, date_to.day, hour=15, minute=0) - timedelta(days=1)
        departure_to = datetime( date_to.year, date_to.month, date_to.day, hour=0, minute=59)

        return [
            Q(departure__gte=LOCAL_TZ.localize(departure_from)),
            Q(departure__lte=LOCAL_TZ.localize(departure_to)),
        ]

    @staticmethod
    def get_departure_from_filter(date_to_str):
        date_to = datetime.strptime(date_to_str, '%d.%m.%Y')
        departure_from = datetime(date_to.year, date_to.month, date_to.day, hour=15, minute=0) + timedelta(days=1)
        departure_to = datetime(date_to.year, date_to.month, date_to.day, hour=0, minute=59) + timedelta(days=2)

        return [
            Q(departure__gte=LOCAL_TZ.localize(departure_from)),
            Q(departure__lte=LOCAL_TZ.localize(departure_to)),
        ]

    @staticmethod
    def get_time_filter():
        # TODO: поезда с 12 до часу ночи
        return [
            Q(departure_time__gte=time(hour=15, minute=0)),
            Q(departure_time__lte=time(hour=23, minute=59)),
        ]

    @staticmethod
    def get_way_filter(way):
        return [Q(way=way)]

    @staticmethod
    def get_city_filter(direction, city_name):
        if direction == 'to':
            return [Q(way__from_city__name__exact=city_name)]
        else:
            return [Q(way__to_city__name__exact=city_name)]

    def get_routes(self, filters, direction='to'):
        trip_filters = []
        if direction == 'to':
            if filters.get('date_to_str'):
                trip_filters += self.get_departure_to_filter(filters['date_to_str'])
            else:
                trip_filters += self.get_time_filter()
            if filters.get('way_to'):
                trip_filters += self.get_way_filter(filters['way_to'])
            if filters.get('city_from'):
                trip_filters += self.get_city_filter(direction, filters['city_from'])
        else:
            if filters.get('date_to_str'):
                trip_filters += self.get_departure_from_filter(filters['date_to_str'])
            else:
                trip_filters += self.get_time_filter()
            if filters.get('way_from'):
                trip_filters += self.get_way_filter(filters['way_from'])
            if filters.get('city_from'):
                trip_filters += self.get_city_filter(direction, filters['city_from'])

        all_routes = self.all().filter(reduce(operator.and_, trip_filters))

        result = {}
        if direction == 'to':
            def group_key(x): return x.key_day(+1), x.way.to_city_id
        else:
            def group_key(x): return x.key_day(-1), x.way.from_city_id

        for (date, city_id), routes in itertools.groupby(all_routes, key=group_key):
            routes = list(routes)
            for r in routes:
                if direction == 'to':
                    fw = ForwardRouteScoresCalculator(r, routes)
                else:
                    fw = BackwardRouteScoresCalculator(r, routes)
                r.score = fw.calc_score()
            ordered = sorted(routes, key=operator.attrgetter('score'), reverse=True)
            result[(date, city_id)] = ordered

        return result

    def get_trips(self, filters):
        routes_to = self.get_routes({
            'date_to_str': filters.get('date_to_str'),
            'way_to': filters.get('way_to'),
            'city_from': filters.get('city_from'),
        }, direction='to')
        routes_from = self.get_routes({
            'date_to_str': filters.get('date_to_str'),
            'way_from': filters.get('way_from'),
            'city_from': filters.get('city_from'),
        }, direction='from')

        # сортировка по дате, потом по городу TODO: что-нибудь получше
        common_dates = sorted(set(routes_to.keys()) & set(routes_from.keys()), key=lambda x: (x[0], x[1]))
        for key_date, city_id in common_dates:
            yield {
                'filters': filters,
                'key_date': key_date,
                'date_to': get_date_to(key_date),
                'city_id': city_id,
                'way_to': routes_to[(key_date, city_id)][0].way,
                'way_from': routes_from[(key_date, city_id)][0].way,
                'routes_to': routes_to[(key_date, city_id)],
                'routes_to_count': len(routes_to[(key_date, city_id)]),
                'routes_from': routes_from[(key_date, city_id)],
                'routes_from_count': len(routes_from[(key_date, city_id)]),
            }


class ForwardRoutesManager(models.Manager):
    def get_by_date(self, filters):
        # Ищем поезда ТУДА с 15:00 до 01:00 следующего дня
        depature_from = datetime(
            filters['forward_date'].year,
            filters['forward_date'].month,
            filters['forward_date'].day,
            hour=15,
            minute=0,
        ) - timedelta(days=1)

        depature_to = datetime(
            filters['forward_date'].year,
            filters['forward_date'].month,
            filters['forward_date'].day,
            hour=0,
            minute=59,
        )
        all_routes = self.all().filter(
            departure__gte=LOCAL_TZ.localize(depature_from),
            departure__lte=LOCAL_TZ.localize(depature_to),
        )

        result = []
        for city_id, routes in itertools.groupby(all_routes, key=lambda x: x.way.to_city_id):
            routes = list(routes)
            # print('   ', date, len(routes))
            for r in routes:
                fw = ForwardRouteScoresCalculator(r, routes)
                r.score = fw.calc_score()
            ordered = sorted(routes, key=operator.attrgetter('score'), reverse=True)
            result.append(ordered)

        return result

    def get_by_city(self, filters):
        # TODO: Ищем поезда ТУДА с 15:00 до 01:00 следующего дня
        all_routes = self.all().filter(
            way=filters['way']
        )

        result = []
        for date, routes in itertools.groupby(all_routes, key=lambda x: x.departure.astimezone(LOCAL_TZ).strftime('%Y-%m-%d')):
            routes = list(routes)
            # print('   ', date, len(routes))
            for r in routes:
                fw = ForwardRouteScoresCalculator(r, routes)
                r.score = fw.calc_score()
            ordered = sorted(routes, key=operator.attrgetter('score'), reverse=True)
            result.append(ordered)

        return result

    def get_by_city_and_date(self, filters):
        # Ищем поезда ТУДА с 15:00 до 01:00 следующего дня
        depature_from = datetime(
            filters['forward_date'].year,
            filters['forward_date'].month,
            filters['forward_date'].day,
            hour=15,
            minute=0,
        ) - timedelta(days=1)

        depature_to = datetime(
            filters['forward_date'].year,
            filters['forward_date'].month,
            filters['forward_date'].day,
            hour=0,
            minute=59,
        )

        routes = self.all().filter(
            departure__gte=LOCAL_TZ.localize(depature_from),
            departure__lte=LOCAL_TZ.localize(depature_to),
            way=filters['way']
        )

        for r in routes:
            fw = ForwardRouteScoresCalculator(r, routes)
            r.score = fw.calc_score()
        ordered = sorted(routes, key=operator.attrgetter('score'), reverse=True)

        return ordered#[:ROUTES_COUNT]


class BackwardRoutesManager(models.Manager):
    def get_by_date(self, filters):
        # Ищем поезда ТУДА с 15:00 до 01:00 следующего дня
        depature_from = datetime(
            filters['forward_date'].year,
            filters['forward_date'].month,
            filters['forward_date'].day,
            hour=15,
            minute=0,
        ) + timedelta(days=1)

        depature_to = datetime(
            filters['forward_date'].year,
            filters['forward_date'].month,
            filters['forward_date'].day,
            hour=0,
            minute=59,
        ) + timedelta(days=2)
        all_routes = self.all().filter(
            departure__gte=LOCAL_TZ.localize(depature_from),
            departure__lte=LOCAL_TZ.localize(depature_to),
        )

        result = []
        for city_id, routes in itertools.groupby(all_routes, key=lambda x: x.way.from_city_id):
            routes = list(routes)
            # print('   ', date, len(routes))
            for r in routes:
                fw = BackwardRouteScoresCalculator(r, routes)
                r.score = fw.calc_score()
            ordered = sorted(routes, key=operator.attrgetter('score'), reverse=True)
            result.append(ordered)

        from pprint import pprint
        pprint(result)

        return result

    def get_by_city(self, filters):
        # TODO: Ищем поезда ТУДА с 15:00 до 01:00 следующего дня
        all_routes = self.all().filter(
            way=filters['way']
        )

        result = []
        for date, routes in itertools.groupby(all_routes, key=lambda x: x.departure.astimezone(LOCAL_TZ).strftime('%Y-%m-%d')):
            routes = list(routes)
            print('   ', date, len(routes))
            for r in routes:
                fw = BackwardRouteScoresCalculator(r, routes)
                # TODO: считать score сразу в базе
                r.score = fw.calc_score()
            ordered = sorted(routes, key=operator.attrgetter('score'), reverse=True)
            result.append(ordered)

        return result

    def get_by_city_and_date(self, filters):
        # Ищем поезда ОБРАТНО с 15:00 до 01:00 следующего дня
        depature_from = datetime(
            filters['forward_date'].year,
            filters['forward_date'].month,
            filters['forward_date'].day,
            hour=15,
            minute=0,
        ) + timedelta(days=1)

        depature_to = datetime(
            filters['forward_date'].year,
            filters['forward_date'].month,
            filters['forward_date'].day,
            hour=0,
            minute=59,
        ) + timedelta(days=2)

        routes = self.all().filter(
            departure__gte=LOCAL_TZ.localize(depature_from),
            departure__lte=LOCAL_TZ.localize(depature_to),
            way=filters['way']
        )
        for r in routes:
            bw = BackwardRouteScoresCalculator(r, routes)
            r.score = bw.calc_score()
        ordered = sorted(routes, key=operator.attrgetter('score'), reverse=True)

        return ordered#[:ROUTES_COUNT]


class Route(models.Model):
    # dynamic fields:
    score = None

    # model's properties:
    way = models.ForeignKey('Way', on_delete=models.SET_NULL, null=True, blank=True)
    request_date = models.DateTimeField(auto_now_add=True, null=True)

    departure = models.DateTimeField(null=True)
    departure_time = models.TimeField(null=True)
    arrive = models.DateTimeField(null=True)
    duration = models.DurationField(null=True)

    carrier = models.CharField(max_length=40, verbose_name='Перевозчик', null=True, blank=True)
    car_description = models.CharField(max_length=40, null=True, blank=True,
                                       verbose_name='Название поезда или тип самолёта', default='')
    route_number = models.CharField(max_length=6, verbose_name='Номер рейса или номер поезда', default='')

    min_price = models.DecimalField(max_digits=8, decimal_places=2, null=True, blank=True)

    objects = models.Manager()
    forward_routes = ForwardRoutesManager()
    backward_routes = BackwardRoutesManager()
    trips = TripsManager()

    def key_day(self, direction=1):
        return (self.departure.astimezone(LOCAL_TZ) + relativedelta(weekday=SA(direction))).strftime('%Y-%m-%d')

    @property
    def car_descr(self):
        return self.car_description or ''

    @property
    def depart(self):
        return self.departure.astimezone(LOCAL_TZ).strftime('%Y-%m-%d %a %H:%M')

    @property
    def arriv(self):
        return self.arrive.astimezone(LOCAL_TZ).strftime('%Y-%m-%d %a %H:%M')

    def __str__(self):
        return '{} {} {} {} = {}₽'.format(self.depart, self.carrier, self.car_description, self.way, self.min_price)

    @staticmethod
    def get(direction, filters):
        routes = Route.objects.filter(way=filters['way'])

        # TODO: поддержать plus_days
        # plus_days = filters.get('plus_days', 0)

        if direction == 'head':
            routes = routes.filter(
                # departure__gte=(filters['forward_date'] - timedelta(days=1)),
                arrive__lte=filters['forward_date']
            )
        else:
            routes = routes.filter(
                departure__gte=(filters['forward_date'] + timedelta(days=1)),
                # arrive__lte=(filters['forward_date'] + timedelta(days=2)),
            )

        return routes


class RouteScoresCalculator:
    def __init__(self, route, other_routes):
        self.route = route
        self.other_routes = other_routes

    def calc_price_score(self):
        if not self.route.min_price:
            return -1000

        all_prices = [r.min_price for r in self.other_routes if r.min_price]

        count_vals = sum(self.route.min_price < x for x in all_prices)
        percentile = float(count_vals) / len(all_prices)

        return percentile

    def calc_duration_score(self):
        try:
            all_durations = [r.duration for r in self.other_routes if r.min_price]

            count_vals = sum(self.route.duration < x for x in all_durations)
            percentile = float(count_vals) / len(all_durations)
        except:
            print('err calc_duration_score', all_durations, count_vals, list(self.other_routes))

        return percentile

    def calc_departure_time_score(self):
        if self.route.departure in TimeRange('21:00', '22:00', LOCAL_TZ):
            return 1.0
        elif self.route.departure in TimeRange('20:00', '21:00', LOCAL_TZ):
            return 0.8
        elif self.route.departure in TimeRange('19:00', '20:00', LOCAL_TZ):
            return 0.7
        elif self.route.departure in TimeRange('18:00', '19:00', LOCAL_TZ):
            return 0.6
        elif self.route.departure in TimeRange('17:00', '18:00', LOCAL_TZ):
            return 0.5
        elif self.route.departure in TimeRange('15:00', '17:00', LOCAL_TZ):
            return 0.4

        elif self.route.departure in TimeRange('22:00', '23:00', LOCAL_TZ):
            return 0.8
        elif self.route.departure in TimeRange('23:00', '23:59', LOCAL_TZ):
            return 0.7
        # TODO: с 00:00 до часу ночи

        return 0.0

    def calc_arrive_time_score(self):
        if self.route.arrive in TimeRange('07:30', '09:00', LOCAL_TZ):
            return 1.0
        elif self.route.arrive in TimeRange('07:00', '07:30', LOCAL_TZ):
            return 0.9
        elif self.route.arrive in TimeRange('06:30', '07:00', LOCAL_TZ):
            return 0.8
        elif self.route.arrive in TimeRange('06:00', '06:30', LOCAL_TZ):
            return 0.7
        elif self.route.arrive in TimeRange('05:30', '06:00', LOCAL_TZ):
            return 0.4
        elif self.route.arrive in TimeRange('05:00', '05:30', LOCAL_TZ):
            return 0.3
        elif self.route.arrive in TimeRange('01:00', '05:00', LOCAL_TZ):
            return 0.1

        elif self.route.arrive in TimeRange('09:00', '10:00', LOCAL_TZ):
            return 0.9
        elif self.route.arrive in TimeRange('10:00', '11:00', LOCAL_TZ):
            return 0.8
        elif self.route.arrive in TimeRange('11:00', '12:00', LOCAL_TZ):
            return 0.7
        elif self.route.arrive in TimeRange('12:00', '13:00', LOCAL_TZ):
            return 0.6
        elif self.route.arrive in TimeRange('13:00', '19:00', LOCAL_TZ):
            return 0.4

        return 0.0


class ForwardRouteScoresCalculator(RouteScoresCalculator):
    def calc_score(self):
        score = 0

        # Фирменный поезд
        if self.route.car_description:
            score += 1.0

        # Цена
        score += 1.5 * self.calc_price_score()

        # Время отправления, прибытия, длительность
        score += 0.5 * self.calc_departure_time_score()
        score += 0.5 * self.calc_arrive_time_score()
        score += 0.2 * self.calc_duration_score()

        # TODO: учесть купе / сидячие
        # TODO: проходящий поезд или нет
        # TODO: исключить цены за инвалидные места
        # TODO: исключить с пересадками (?)

        return score


class BackwardRouteScoresCalculator(RouteScoresCalculator):
    def calc_score(self):
        score = 0

        # Фирменный поезд
        if self.route.car_description:
            score += 1.0

        # Цена
        score += 1.5 * self.calc_price_score()

        # Время отправления, прибытия, длительность
        score += 0.5 * self.calc_departure_time_score()
        score += 0.5 * self.calc_arrive_time_score()
        score += 0.2 * self.calc_duration_score()

        # TODO: учесть купе / сидячие
        # TODO: проходящий поезд или нет
        # TODO: исключить цены за инвалидные места
        # TODO: исключить с пересадками (?)

        return score


class Price(models.Model):
    route = models.ForeignKey('Route', on_delete=models.SET_NULL, null=True, blank=True)
    price = models.DecimalField(max_digits=8, decimal_places=2)
    car_class = models.CharField(max_length=40, verbose_name='Тип вагона или места в самолёте')
    free_seats = models.PositiveSmallIntegerField(null=True, blank=True)

    class Meta:
        ordering = ['price']

