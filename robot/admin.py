from django.contrib import admin
from .models import City, Country, Way, Route, Trip


admin.site.register(City)
admin.site.register(Country)
admin.site.register(Way)
admin.site.register(Route)
admin.site.register(Trip)
