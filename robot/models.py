from django.db import models


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


class Route(models.Model):
    route_types = {
        ('TRAIN', 'Train'),
        ('PLANE', 'Airplane'),
    }
    type = models.CharField(max_length=5, choices=route_types, default='TRAIN')
    from_city = models.ForeignKey('City', on_delete=models.SET_NULL, null=True, related_name='from_city')
    to_city = models.ForeignKey('City', on_delete=models.SET_NULL, null=True, related_name='to_city')

    def __str__(self):
        return '{}: {} - {}'.format(self.type, self.from_city, self.to_city)


class Trip(models.Model):
    route = models.ForeignKey('Route', on_delete=models.SET_NULL, null=True)
    request_date = models.DateTimeField(auto_now_add=True)

    departure = models.DateTimeField()
    arrive = models.DateTimeField()
    duration = models.DurationField()

    min_price = models.DecimalField(max_digits=8, decimal_places=2)
    free_seats = models.PositiveSmallIntegerField(null=True, blank=True)

    carrier = models.CharField(max_length=40, verbose_name='Перевозчик')
    carrier_description = models.CharField(max_length=40, verbose_name='Название поезда или тип самолёта')
    trip_number = models.CharField(max_length=6, verbose_name='Номер рейса или номер поезда')

    @property
    def price(self):
        return '{}₽'.format(self.min_price)

    @property
    def depart(self):
        return self.departure.strftime('%Y-%m-%d %H:%M')

    def __str__(self):
        return '{} {} {} = {}'.format(self.depart, self.carrier, self.route, self.price)
