# Development purposes

PID = /tmp/serving.pid

serve: start
	fswatch -or --event=Updated . | xargs -n1 -I {} make restart

kill:
	-kill `pstree -p \`cat $(PID)\` | tr "\n" " " |sed "s/[^0-9]/ /g" |sed "s/\s\s*/ /g"` 
	
before:
	@echo "STOPPED" && printf '%*s\n' "40" '' | tr ' ' -

start:
	go run main.go & echo $$! > $(PID)

restart: kill before start
	@echo "STARTED $$(date)" && printf '%*s\n' "40" '' | tr ' ' -
	
.PHONY: serve restart kill before start 

# Serve

start-docker:
	docker-compose -f docker-compose-dev.yml build
	docker-compose -f docker-compose-dev.yml up

ssh:
	docker-compose -f docker-compose-dev.yml exec app sh