function sortFunction(a, b, asc) {
    var result;

    /* Default ascending order */
    if (typeof asc === "undefined") asc = true;

    if (a === null) return 1;
    if (b === null) return -1;
    if (a === null && b === null) return 0;

    result = a - b;

    if (isNaN(result)) {
        return (asc) ? a.localeCompare(b) : b.localeCompare(a);
    } else {
        return (asc) ? result : -result;
    }
}

function getCellValue(cell) {
    return cell.dataset.sort || cell.textContent.trim();
}

function sortTable(table, col, reverse) {
    var tb = table.tBodies[0], // use `<tbody>` to ignore `<thead>` and `<tfoot>` rows
        tr = Array.prototype.slice.call(tb.rows, 0), // put rows into array
        i;

    reverse = -((+reverse) || -1);
    tr = tr.sort(function (a, b) {
        return sortFunction(
            getCellValue(a.cells[col]),
            getCellValue(b.cells[col]),
            reverse > 0
        );
    });

    for (i = 0; i < tr.length; ++i) {
        tb.appendChild(tr[i]); // append each row in order
    }

    $(table).find('.head.sortedby').removeClass('sortedby sortedby_asc sortedby_desc');
    $(table).find('.head:eq('+ col +')').addClass(
        'sortedby ' + (reverse > 0 ? 'sortedby_desc' : 'sortedby_asc')
    );

}

function makeSortable(table) {
    var th = table.tHead,
        i;

    th && (th = th.rows[0]) && (th = th.cells);

    if (th) {
        i = th.length;
    } else {
        return; // if no `<thead>` then do nothing
    }

    while (--i >= 0) (function (i) {
        // closure for each column with direction
        var dir = 1;
        th[i].addEventListener('click', function () {
            sortTable(table, i, (dir = 1 - dir));
        });
    }(i));
}

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
    });

    $('.schedulle.table.sortable').each(function(idx, table) {
        makeSortable(table);
    });
});
