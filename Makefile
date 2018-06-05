.PHONY: run start stop

run:
	python manage.py runserver localhost:8000

start:
	mysql.server start

stop:
	mysql.server stop

shell:
	python manage.py shell

update:
	git stash && git pull && git stash apply
	/home/nerevar/www/htravel/htravel_env/bin/python3 manage.py collectstatic
	sudo systemctl daemon-reload && sudo systemctl restart gunicorn
