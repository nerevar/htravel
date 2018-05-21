import math
from datetime import datetime

from django import template
from django.template.defaultfilters import stringfilter
from django.utils.safestring import mark_safe
from django.utils.timezone import pytz
from django.utils import dateformat

from htravel import settings

register = template.Library()
LOCAL_TZ = pytz.timezone(settings.TIME_ZONE)


@register.inclusion_tag('trip.html')
def show_trip(trip, page, routes_limit=3):
    return {
        'trip': trip,
        'page': page,
        'SHOW_ROUTES_COUNT': ':{}'.format(routes_limit)
    }


@register.inclusion_tag('route_row.html')
def route_row(route, idx, direction):
    return {
        'route': route,
        'direction': direction,
        'idx': idx
    }


@register.inclusion_tag('city_link.html')
def city_link(city):
    return {'city_from_str': 'moscow', 'city_to': city}


@register.inclusion_tag('date_link.html')
def date_link(date_to):
    return {'date_to': date_to}


@register.filter()
def schedule_date_format(dt):
    return dateformat.format(dt.astimezone(LOCAL_TZ), 'd b, D').replace('май', 'мая')


@register.filter()
def simple_date_format(dt):
    return dt.astimezone(LOCAL_TZ).strftime('%d.%m.%Y')


@register.filter()
def schedule_time_format(dt):
    return dt.astimezone(LOCAL_TZ).strftime('%H:%M')


@register.filter()
def duration_time_format(dt):
    hours = math.floor(dt.seconds / 3600)
    minutes = math.floor((dt.seconds - hours * 3600) / 60)
    return '{} ч. {} м.'.format(hours, minutes)


@register.filter()
def route_price_format(route):
    if route.price_seated:
        return '{:0.0f} ₽<br/>Сид.'.format(route.price_seated)
    elif route.price_platzkart:
        return '{:0.0f} ₽<br/>Плац.'.format(route.price_platzkart)
    elif route.price_coupe:
        return '{:0.0f} ₽<br/>Купе'.format(route.price_coupe)
    else:
        return '{:0.0f} ₽'.format(route.min_price)


@register.filter()
def score_formatter(score):
    return '{:1.2f}'.format(score)


@register.filter()
@stringfilter
def nbsp(value):
    return mark_safe('&nbsp;'.join(value.split(' ')))
