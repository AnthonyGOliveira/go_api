IMAGE_NAME=goapi-postgres
CONTAINER_NAME=goapi-postgres
ENV_FILE=infra/.env
VOLUME_NAME=pgdata

build:
	docker build -t $(IMAGE_NAME):latest ./infra/

run:
	docker run -d --name $(CONTAINER_NAME) --env-file $(ENV_FILE) -p 5432:5432 -v $(VOLUME_NAME):/var/lib/postgresql/data $(IMAGE_NAME):latest

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

logs:
	docker logs -f $(CONTAINER_NAME)

.PHONY: build run stop logs
