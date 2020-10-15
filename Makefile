REPO_OWNER:=streamaserver 
PROJECT:=streama
MULTIARCH:=false
ARCHS:=linux/amd64
VERSION:='latest'
ALPINE:=false
ifeq (true, $(MULTIARCH))
	ARCHS:=linux/amd64,linux/arm64/v8
endif

all: setup build

setup:
	@./buildx.sh

build:
	@docker buildx build \
	$(ENV) \
	--file ./docker/Dockerfile \
	--platform $(ARCHS) \
	--push --tag $(REPO_OWNER)/$(PROJECT):$(VERSION) .
