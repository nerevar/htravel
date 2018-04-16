from django.core.management.base import BaseCommand

from robot.models import JsonDump, Route, RouteArchive


class Command(BaseCommand):
    help = 'Удаляет все маршруты `Route` из базы и архивы `RouteArchive`'

    def add_arguments(self, parser):
        parser.add_argument(
            '--dumps',
            action='store_true',
            dest='dumps',
            help='Clear all dumps in db',
        )

    def handle(self, *args, **options):
        self.stdout.write(self.help)

        Route.objects.all().delete()
        RouteArchive.objects.all().delete()

        if options['dumps']:
            JsonDump.objects.all().delete()

        self.stdout.write('Done')
