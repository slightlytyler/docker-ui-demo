GIT_SHA=$(shell git rev-parse HEAD)
REPO=slightlytyler/docker-ui-demo

all: build

build:
	docker build -t $(REPO):$(GIT_SHA) . \
		&& docker tag $(REPO):$(GIT_SHA) $(REPO):latest

.PHONY: build
