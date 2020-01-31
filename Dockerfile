ARG ARCH=amd64
ARG OS_FAMILY=ubuntu
ARG OS_DISTRO=bionic

FROM ${ARCH}/${OS_FAMILY}:${OS_DISTRO}

# recover arguments
ARG ARCH
ARG OS_FAMILY
ARG OS_DISTRO

# configure environment: system & libraries
ENV ARCH=${ARCH}
ENV OS_FAMILY=${OS_FAMILY}
ENV OS_DISTRO=${OS_DISTRO}
ENV LETSENCRYPT_DIR=/etc/letsencrypt
ENV DEBIAN_FRONTEND=noninteractive
ENV QEMU_EXECVE 1

# Add QEMU support
COPY ./assets/qemu/${ARCH}/ /usr/bin/

# install support for SSL
RUN apt update \
  && apt install -y \
    apache2 \
    software-properties-common \
  && add-apt-repository ppa:certbot/certbot \
  && apt update \
  && apt install -y \
    certbot \
    # clean the apt cache
  && rm -rf /var/lib/apt/lists/*

# copy scripts
COPY assets/help-certificate /usr/local/bin/
COPY assets/check-environment /usr/local/bin/
COPY assets/create-certificate /usr/local/bin/
COPY assets/renew-certificate /usr/local/bin/
COPY assets/create-account /usr/local/bin/

# default to help
CMD 'help-certificate'
