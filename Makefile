.PHONY: run start stop

run:
	python manage.py runserver localhost:8000

start:
	mysql.server start

stop:
	mysql.server stop

shell:
	python manage.py shell
