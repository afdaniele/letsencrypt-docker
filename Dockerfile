FROM nimmis/apache:latest

# constants
ENV LETSENCRYPT_DIR /etc/letsencrypt

# install support for SSL
RUN apt update \
  && apt install -y \
    software-properties-common \
  && add-apt-repository universe \
  && add-apt-repository ppa:certbot/certbot \
  && apt update \
  && apt install -y \
    certbot \
    python-certbot-apache \
    # clean the apt cache
  && rm -rf /var/lib/apt/lists/*
