export DOCKER_CONTAINER ?= slack-viewer
export DOCKER_ORG ?= cloudposse
export DOCKER_IMAGE ?= $(DOCKER_ORG)/$(DOCKER_CONTAINER)
export DOCKER_TAG ?= latest
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)

export DOCKER_VOLUME ?= /opt/slack-export-viewer

export EXPORT_PATH ?=
export EXPORT_FILE ?=

-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)

## Initialize build-harness, build docker container and run container
all: init build install run
	@exit 0

## Build docker image
build:
	@make --no-print-directory docker/build

## Push docker image to registry
push:
	docker push $(DOCKER_IMAGE)

## Start the docker container
run:
	@echo "Run container with EXPORT_PATH=$2 and EXPORT_FILE=$3"
	docker run -p 5000:5000 -v $(EXPORT_PATH):$(DOCKER_VOLUME) \
		--rm --name $(DOCKER_CONTAINER) -it $(DOCKER_IMAGE_NAME) $(EXPORT_PATH) $(EXPORT_FILE)

## Delete images
delete:
	docker rmi $(DOCKER_IMAGE_NAME)
