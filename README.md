# Holidays travel


MySQL:
* Запустить сервер: `mysql.server start`

Django:
* Предварительно: 
```
source activate htravel
```
* Запустить сервер:
```
python manage.py runserver localhost:8000
```
* Интерактивная оболочка:
```
python manage.py shell
```



### РЖД
API: https://github.com/visavi/rzd-api

Пример запроса: https://pass.rzd.ru/timetable/public/ru?STRUCTURE_ID=735&layer_id=5371&dir=0&tfl=3&checkSeats=1&code0=2000000&code1=2004000&dt0=13.04.2018&dt1=15.04.2018

Коды городов:
```
Москва 2000000
Казань 2060615
Санкт-Петербург 2004000
Ростов-на-Дону 2064001
Сочи 2064130
Новочеркасск 2064230
Минск 2100000
Чернышевское 2058034 Нестеров 2058434
КРАСНОДАР 2064788
Таллин 2600000
```



### Авиа
Направления на самолёт: http://map.aviasales.ru/supported_directions.json?origin_iata=MOW&one_way=false&locale=ru
