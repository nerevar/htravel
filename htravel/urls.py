"""htravel URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from robot.views import add_test_trips, clear_trips, download_test_routes, download_april_may
from searcher.views import main, by_city_and_date, by_city, by_date

from django.views.generic import RedirectView
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
    path('favicon.ico', RedirectView.as_view(url='/static/favicon.png'), name='favicon'),
    path('add_test_trips', add_test_trips, name='add_test_trips'),
    path('download_test_routes', download_test_routes, name='download_test_routes'),
    path('download_april_may', download_april_may, name='download_april_may'),
    path('clear_trips', clear_trips, name='clear_trips'),
    path('', main, name='main'),
    path('trip/<str:city_from>/<str:city_to>/<str:date_start>', by_city_and_date, name='by_city_and_date'),
    path('trip/<str:city_from>/<str:city_to>', by_city, name='by_city'),
    path('trip/<str:date_start>', by_date, name='by_date'),
]
