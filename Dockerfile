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
    # clean the apt cache
  && rm -rf /var/lib/apt/lists/*

# copy scripts
COPY assets/help-certificate /usr/local/bin/
COPY assets/check-environment /usr/local/bin/
COPY assets/create-certificate /usr/local/bin/
COPY assets/renew-certificate /usr/local/bin/

# default to help
CMD 'help-certificate'
