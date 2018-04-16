from django.core.management.base import BaseCommand

from robot.models import JsonDump


class Command(BaseCommand):
    help = 'У всех дампов `JsonDump` меняет статус на downloaded'

    def handle(self, *args, **options):
        self.stdout.write(self.help)

        JsonDump.objects.all().update(status='downloaded')

        self.stdout.write('Done')
