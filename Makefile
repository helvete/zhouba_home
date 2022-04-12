#!/usr/bin/make -f

main: run

run:
	docker-compose up --build --force-recreate -d

stop:
	docker-compose down
