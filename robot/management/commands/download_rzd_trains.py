from django.core.management.base import BaseCommand

from robot.crawler import download_rzd_trains
from robot.parser import RzdParser
from robot.updater import Updater
from robot.models import JsonDump

"""
Крон crawler, скачивает новые дампы с РЖД API и обновляет маршруты
"""


class Command(BaseCommand):
    help = 'Крон crawler, скачивает новые дампы с РЖД API и обновляет маршруты'

    def add_arguments(self, parser):
        parser.add_argument(
            '--download',
            action='store_true',
            dest='download',
            help='Download all routes',
        )
        parser.add_argument(
            '--download_sample',
            action='store_true',
            dest='download_sample',
            help='Download sample routes',
        )
        parser.add_argument(
            '--parse',
            action='store_true',
            dest='parse',
            help='Parse all current or downloaded routes',
        )
        parser.add_argument(
            '--no-save',
            action='store_true',
            dest='no_save',
            help='Just download or parse data without saving to DB',
        )

    def handle(self, *args, **options):
        self.stdout.write(self.help)

        if options['download']:
            self.stdout.write('Download all routes')
            dumps = download_rzd_trains(max_days_range=90)
        else:
            dumps = JsonDump.objects.filter(status='downloaded')
            self.stdout.write('Current downloaded routes: {}'.format(len(dumps)))

        if options['parse']:
            self.stdout.write('Parse dumps')
            for dump in dumps:
                self.stdout.write('  < Parse dump {}'.format(dump.filename))

                parser = RzdParser(dump.get_data(), dump.trip)
                for way, routes in parser.parse():
                    routes = list(routes)
                    print('        Parsed way: {}, routes: {}, save? {}'.format(way, len(routes), not options['no_save']))
                    if not options['no_save']:
                        Updater(routes).update()

                self.stdout.write('  > Total: parsed {} ways, {} routes, saved? {}\n'.format(
                    parser.ways_count, parser.routes_count, not options['no_save']
                ))
                if not options['no_save']:
                    dump.status = 'parsed'
                    dump.save()

