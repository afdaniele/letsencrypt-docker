# letsencrypt-docker

Docker image with certbot for letsencrypt.
This Docker image lets you easily create or renew SSL keys for your websites.


### What do I need?

- A linux machine (Ubuntu preferred)
- A public IP on that machine
- A DNS domain pointing to that IP
- The port `TCP/80` available


### What do I get?

You get single-domain SSL certificate and private key files.


### How to use it

#### Create a new certificate

Run the following command:
```
make create-certificate DOMAIN=[your_domain] DATA=[path_to_letsencrypt_data]
```

where:
 - `[your_domain]` is the domain you want to create the SSL key for.
 - `[path_to_letsencrypt_data]` is the data directory for Let's Encrypt (usually `/etc/letsencrypt/`) which must contain an Let's Encrypt ACME account in `accounts/`.


#### Renew an existing certificate

Run the following command:
```
make renew-certificate DOMAIN=[your_domain] DATA=[path_to_letsencrypt_data]
```

where:
- `[your_domain]` is the domain you want to renew the SSL key for.
- `[path_to_letsencrypt_data]` is the data directory for Let's Encrypt (usually `/etc/letsencrypt/`) which must contain an Let's Encrypt ACME account in `accounts/`.
