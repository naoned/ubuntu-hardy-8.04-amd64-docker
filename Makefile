PWD=$(shell pwd)
IMAGE_NAME=naoned/ubuntu
IMAGE_TAG=8.04

build: ensure-is-root clean hardy-chroot build-image

ensure-is-root:
	./scripts/ensure_is_root.sh

hardy-chroot: target-dir
	debootstrap --arch amd64 hardy ${PWD}/hardy-chroot http://old-releases.ubuntu.com/ubuntu

target-dir:
	mkdir -p ${PWD}/hardy-chroot

build-image:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

install-deps: ensure-is-root
	apt-get update
	apt-get install -y debootstrap

clean:
	rm -rf ${PWD}/hardy-chroot

.PHONY: build ensure-is-root build-image install-deps
