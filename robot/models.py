from django.db import models
from django.utils import timezone


class Country(models.Model):
    title = models.CharField(max_length=50)
    code = models.CharField(max_length=10)

    def __str__(self):
        return self.title


class City(models.Model):
    title = models.CharField(max_length=50)
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

    def min_price(self):
        prices = Price.objects.filter(route=self)
        if len(prices) > 0:
            return prices[0].price
        else:
            return None

    @property
    def depart(self):
        return self.departure.strftime('%Y-%m-%d %H:%M')

    def __str__(self):
        return '{} {} {} = {}₽'.format(self.depart, self.carrier, self.way, self.min_price())


class Price(models.Model):
    route = models.ForeignKey('Route', on_delete=models.CASCADE, null=True, blank=True)
    price = models.DecimalField(max_digits=8, decimal_places=2)
    car_class = models.CharField(max_length=40, verbose_name='Тип вагона или места в самолёте')
    free_seats = models.PositiveSmallIntegerField(null=True, blank=True)

    class Meta:
        ordering = ['price']
