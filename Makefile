# Created by Andrea F. Daniele
# ----------------------------------------

IMAGE="afdaniele/letsencrypt"

build:
	@docker build -t "${IMAGE}" ./

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
		afdaniele/letsencrypt:latest \
			${action}

check-env:
ifndef DOMAIN
	$(error DOMAIN is undefined)
endif
ifndef DATA
	$(error DATA is undefined)
endif
