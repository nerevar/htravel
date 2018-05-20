$(function () {
    function getFullUrl($trip, route_to, route_from) {
        var depStation = $trip.data('departure-station');
        var arrStation = $trip.data('arrive-station');
        var tuturuUrl = 'https://www.tutu.ru/poezda/order/round_trip/?trip_number=1' +
            '&dep_st=' + depStation + '&arr_st=' + arrStation +
            '&departure_st=' + depStation + '&arrival_st=' + arrStation +
            '&tn=' + route_to.data('train') +
            '&date=' + route_to.data('date') +
            '&dep_st_second=' + arrStation + '&arr_st_second=' + depStation +
            '&departure_st_second=' + arrStation + '&arrival_st_second=' + depStation +
            '&tn_second=' + route_from.data('train') +
            '&date_second=' + route_from.data('date');

        return 'https://c45.travelpayouts.com/click?custom_url=' +
            encodeURIComponent(tuturuUrl) +
            '&shmarker=163987&promo_id=1770&source_type=customlink&type=click';
    }

    function getTripSelectedRoutes($trip) {
        var route_to = $trip.find('.route_picker_to:checked').parents('.schedulle__row');
        var route_from = $trip.find('.route_picker_from:checked').parents('.schedulle__row');
        if (route_to.length && route_from.length) {
            return [route_to, route_from]
        }
    }

    function updateTripTotalPrice($trip) {
        var routes = getTripSelectedRoutes($trip);
        if (!routes) {
            return;
        }

        $trip.find('.route_total_price').text(
            parseFloat(routes[0].data('price')) + parseFloat(routes[1].data('price'))
        );

        $trip.find('.btn-buy').attr('href', getFullUrl($trip, routes[0], routes[1]));
    }

    $('.trip').each(function(idx, trip) {
        // при загрузке страницы загружаем цену первых-лучших поездов для каждого трипа
        updateTripTotalPrice($(trip));
    });

    $('.route_picker').change(function () {
        // обновляем цену при выборе поездов
        updateTripTotalPrice($(this).parents('.trip'));
    })
});
