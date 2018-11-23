# Default env vars
API_URL?=
PORT?=3000

GIT_SHA=$(shell git rev-parse HEAD)
TAG=slightlytyler/docker-ui-demo
TAG_DEV=slightlytyler/docker-ui-demo-dev
VOLUME_MOUNTS=-v $(PWD)/src:/usr/app/src

all: build

build:
	docker build -t $(TAG):$(GIT_SHA) . \
		&& docker tag $(TAG):$(GIT_SHA) $(TAG):latest

build-dev:
	docker build -f dev.Dockerfile -t $(TAG_DEV):$(GIT_SHA) . \
		&& docker tag $(TAG_DEV):$(GIT_SHA) $(TAG_DEV):latest

run-dev:
	docker run -it --rm -p $(PORT):$(PORT) $(VOLUME_MOUNTS) $(TAG_DEV) \
		dev --env.api-url $(API_URL) --env.host 0.0.0.0 --env.port $(PORT)

.PHONY: build build-dev run-dev
