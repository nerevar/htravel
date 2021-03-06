import logging

from django.db import transaction
from django.utils.timezone import pytz

from htravel import settings
from robot.models import Route, RouteArchive, Trip

LOCAL_TZ = pytz.timezone(settings.TIME_ZONE)
logger = logging.getLogger(__name__)


class Updater:
    def __init__(self, routes):
        self.routes = list(routes)
        if not self.routes:
            return
        self.way = self.routes[0].way
        self.day = self.routes[0].departure.astimezone(LOCAL_TZ).strftime('%d.%m.%Y')

    def add(self):
        if not self.routes:
            return

        """просто сохраняет маршруты в базу"""
        Route.objects.bulk_create(self.routes)

    def update(self):
        if not self.routes:
            return

        """обновляет имеющиеся маршруты в базе на новые"""
        current_routes = list(Trip.trips.get_routes({
            'city_from': self.way.city_from,
            'departure_day': self.day,
            'way': self.way,
        }, group=False))

        # TODO: логирование
        print('            update current_routes: {}, new_routes: {}, way: {}, dep_day: {}'.format(
            len(current_routes), len(list(self.routes)),
            self.way, self.day
        ))

        if len(current_routes) == 0:
            return self.add()

        # TODO: django-bulk-update
        # https://stackoverflow.com/questions/36765184/way-to-bulk-update-with-unique-values-in-django
        # https://stackoverflow.com/questions/12661253/how-to-bulk-update-with-django
        with transaction.atomic():
            # copy current routes to archive
            # TODO: сохранять в базу только изменившиеся маршруты
            RouteArchive.objects.bulk_create(
                [RouteArchive(**x.json_data) for x in current_routes]
            )

            for route in current_routes:
                found = False
                for r in self.routes:
                    if r.train == route.train:
                        if r.min_price - route.min_price > 1:
                            print('update route {}, price {} -> {}'.format(route.train, route.min_price, r.min_price))
                        route.__dict__.update(r.json_data)
                        route.save(update_fields=r.json_data.keys())
                        found = True
                if not found:
                    print('no more route', route)
                    # TODO: удалять ли, или занулять
                    Route.objects.filter(pk=route.id).delete()
