# Created by Andrea F. Daniele
# ----------------------------------------

ARCH="amd64"
IMAGE="afdaniele/letsencrypt:latest-${ARCH}"

build:
	@docker build -t "${IMAGE}" --build-arg ARCH=${ARCH} ./

push:
	@docker push "${IMAGE}"

pull:
	@docker pull "${IMAGE}"

create-certificate: action="create-certificate"

renew-certificate: action="renew-certificate"

create-certificate renew-certificate: check-env
	@docker run -it --rm \
		-p 80:80 \
		-v ${DATA}:/etc/letsencrypt/ \
		-e DOMAIN=${DOMAIN} \
		--name letsencrypt-running \
		${IMAGE} \
			${action}

check-env:
ifndef DOMAIN
	$(error DOMAIN is undefined)
endif
ifndef DATA
	$(error DATA is undefined)
endif
