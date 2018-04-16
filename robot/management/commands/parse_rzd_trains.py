from django.core.management.base import BaseCommand, CommandError


"""
runs every N (+0.5) hours after download_rzd_trains 

transaction_start

for dump in new_dumps:
    data = parse(dump)
    way = data.way
    train = data.train
    date_start = data.date_start
    
    if route = Route.find(train, date_start):
        route.copy_to_archive()
        route.update(by=data)
    else:
        Route.create(data)    

"""


class Command(BaseCommand):
    help = 'Parse rzd saved dumps to db'

    def handle(self, *args, **options):
        self.stdout.write('hello world')
