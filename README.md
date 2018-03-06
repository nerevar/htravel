# Holidays travel

### Milestones
##### РЖД:
- [x] json_dump parser с определением пути (way)
- [x] несколько городов
- [x] красивый список билетов в таблице по всем городам
- [x] билеты туда-обратно сразу в одном "трипе"
- [ ] фильтр по датам, +- 1-2 дня
- [ ] ранжирование билетов по score
- [ ] view просмотр выбранного города со всеми датами
- [ ] view просмотр выбранных выходных со всеми городами
- [ ] нормальный дизайн забабахать
- [ ] поддержка выездов не только из Москвы
- [ ] фильтрация только нормальных билетов
- [ ] запуск по крону скачиваний
- [ ] партнёрка с РЖД / tutu

##### Авиа:
- [ ] aviasales API
- [ ] skyskanner API
- [ ] Pobeda crawler

### Cli команды

MySQL:
* Запустить сервер:
```
mysql.server start
```

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

Пример запроса: 
* СПб туда https://pass.rzd.ru/timetable/public/ru?STRUCTURE_ID=735&layer_id=5371&dir=0&tfl=3&checkSeats=1&code0=2000000&code1=2004000&dt0=13.04.2018&dt1=15.04.2018
* Казань туда-обратно https://pass.rzd.ru/timetable/public/ru?STRUCTURE_ID=735&layer_id=5371&dir=1&tfl=3&checkSeats=1&code0=2000000&code1=2060615&dt0=13.04.2018&dt1=15.04.2018

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
