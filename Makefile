start:
	docker-compose -f docker-compose.development.yml build
	docker-compose -f docker-compose.development.yml up

ssh:
	docker-compose -f docker-compose.development.yml exec api sh

stop:
	docker-compose -f docker-compose.development.yml down