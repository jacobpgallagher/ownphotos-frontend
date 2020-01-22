.PHONY: default build run shell

DOCKER_TAG ?= ownphotos-frontend

default: build

build:
	docker build -t $(DOCKER_TAG) .

run: build
	docker run $(DOCKER_TAG)

build-react: build
	mkdir -p build
	docker run -v `pwd`/build/:/usr/src/app/build/ ${DOCKER_TAG} npm run-script build

shell: build
	docker run --rm -it $(DOCKER_TAG) /bin/bash
