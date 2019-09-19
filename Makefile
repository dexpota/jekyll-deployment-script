.PHONY:=build
build:
	docker build -t webhook .

.PHONY:=rm
rm:
	docker rm webhook

.PHONY:=run
run:
	docker run -d -p 9000:9000 --env-file=env_file --name=webhook webhook

.PHONY:=start
start:
	docker start webhook

.PHONY:=stop
stop:
	docker stop webhook

.PHONY:=logs
logs:
	docker logs -f webhook
