from django import template

register = template.Library()


@register.inclusion_tag('trip.html')
def show_trip(trip, type, routes_limit=3):
    return {
        'trip': trip,
        'type': type,
        'SHOW_ROUTES_COUNT': ':{}'.format(routes_limit)
    }


@register.inclusion_tag('city_link.html')
def city_link(city):
    return {'city_from_str': 'moscow', 'city_to': city}


@register.inclusion_tag('date_link.html')
def date_link(date_to):
    return {'date_to': date_to}
