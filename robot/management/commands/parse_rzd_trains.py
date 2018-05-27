from django.core.management.base import BaseCommand, CommandError

from robot.parser import RzdParser
from robot.models import JsonDump


class Command(BaseCommand):
    help = 'Parse rzd saved dumps to db'

    def handle(self, *args, **options):
        dump = JsonDump.objects.get(id=107)
        self.stdout.write('  Parse dump {}'.format(dump.filename))

        parser = RzdParser(dump.get_data(), dump.trip)
        for way, routes in parser.parse():
            print('way: {}'.format(way))
            print('routes: {}'.format(list(routes)))

