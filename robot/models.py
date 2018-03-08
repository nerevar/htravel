import operator
from htravel import settings
from django.utils.timezone import pytz
from datetime import timedelta
from django.db import models
from django.db.models import Q

ROUTES_COUNT = 5


class Country(models.Model):
    title = models.CharField(max_length=50)
    code = models.CharField(max_length=10)

    def __str__(self):
        return self.title


class City(models.Model):
    title = models.CharField(max_length=50)
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


class ForwardRoutesManager(models.Manager):
    # 1. Получить всёваще
    # 2. Отфильтровать нужный way (город)
    # 3. TODO: Отфильтровать по дате выезда
    # 4. Рассчитать forward_score
    # 5. Взять топ по forward_score

    def get(self, filters):
        # TODO: фильтр по дате
        routes = self.all().filter(way=filters['way'])
        for r in routes:
            r.score = r.calc_forward_score(routes)
        ordered = sorted(routes, key=operator.attrgetter('score'), reverse=True)

        return ordered[:ROUTES_COUNT]


class Route(models.Model):
    way = models.ForeignKey('Way', on_delete=models.SET_NULL, null=True, blank=True)
    request_date = models.DateTimeField(auto_now_add=True, null=True)

    departure = models.DateTimeField(null=True)
    arrive = models.DateTimeField(null=True)
    duration = models.DurationField(null=True)

    carrier = models.CharField(max_length=40, verbose_name='Перевозчик', null=True, blank=True)
    car_description = models.CharField(max_length=40, null=True, blank=True,
                                       verbose_name='Название поезда или тип самолёта', default='')
    route_number = models.CharField(max_length=6, verbose_name='Номер рейса или номер поезда', default='')

    objects = models.Manager()
    forward_routes = ForwardRoutesManager()

    score = None

    @property
    def min_price(self):
        prices = Price.objects.filter(
            ~Q(car_class__contains='Сидячий') | Q(route__duration__lte=timedelta(hours=4, minutes=30)),
            route=self
        )
        if len(prices) > 0:
            return float(prices[0].price)
        else:
            return None

    def get_platzkart_price(self):
        prices = Price.objects.filter(route=self, car_class='Плацкартный')
        if len(prices) > 0:
            return float(prices[0].price)
        else:
            return None

    def calc_price_score(self, other_routes):
        current_price = self.get_platzkart_price()
        if not current_price:
            return -1000

        all_prices = [x.get_platzkart_price() for x in other_routes]
        all_prices = [x for x in all_prices if x]

        count_vals = sum(current_price < x for x in all_prices)
        percentile = float(count_vals) / len(all_prices)

        return percentile

    def calc_forward_score(self, other_routes):
        score = 0

        # Фирменный поезд
        if self.car_description:
            score += 1.0 * 1.0

        # Цена
        score += 1.0 * self.calc_price_score(other_routes)

        # TODO: длительность поездки
        # TODO: время отправления, время прибытия
        # TODO: учесть купе / сидячие
        # TODO: проходящий поезд или нет
        # TODO: исключить цены за инвалидные места

        # print(self, score, self.car_description)
        return score

    @property
    def car_descr(self):
        return self.car_description or ''

    @property
    def depart(self):
        local_tz = pytz.timezone(settings.TIME_ZONE)
        return self.departure.astimezone(local_tz).strftime('%Y-%m-%d %a %H:%M')

    def __str__(self):
        return '{} {} {} {} = {}₽'.format(self.depart, self.carrier, self.car_description, self.way, self.min_price)

    @staticmethod
    def get(direction, filters):
        routes = Route.objects.filter(way=filters['way'])

        # TODO: поддержать plus_days
        # plus_days = filters.get('plus_days', 0)

        if direction == 'head':
            routes = routes.filter(
                # departure__gte=(filters['start_date'] - timedelta(days=1)),
                arrive__lte=filters['start_date']
            )
        else:
            routes = routes.filter(
                departure__gte=(filters['start_date'] + timedelta(days=1)),
                # arrive__lte=(filters['start_date'] + timedelta(days=2)),
            )

        return routes


class Price(models.Model):
    route = models.ForeignKey('Route', on_delete=models.SET_NULL, null=True, blank=True)
    price = models.DecimalField(max_digits=8, decimal_places=2)
    car_class = models.CharField(max_length=40, verbose_name='Тип вагона или места в самолёте')
    free_seats = models.PositiveSmallIntegerField(null=True, blank=True)

    class Meta:
        ordering = ['price']
