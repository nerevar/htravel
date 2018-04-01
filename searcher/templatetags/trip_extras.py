from django import template

register = template.Library()


@register.inclusion_tag('trip.html')
def show_trip(trip, type, routes_limit=3):
    return {
        'trip': trip,
        'type': type,
        'SHOW_ROUTES_COUNT': ':{}'.format(routes_limit)
    }
