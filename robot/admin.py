from django.contrib import admin
from .models import City, Country, Way, Route, Price


admin.site.register(City)
admin.site.register(Country)
admin.site.register(Way)
admin.site.register(Route)
admin.site.register(Price)
