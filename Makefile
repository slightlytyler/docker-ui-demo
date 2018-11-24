GIT_SHA=$(shell git rev-parse HEAD)
TAG=slightlytyler/docker-ui-demo

all: build

build:
	docker build -t $(TAG):$(GIT_SHA) . \
		&& docker tag $(TAG):$(GIT_SHA) $(TAG):latest

.PHONY: build
