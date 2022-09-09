#!/bin/bash

# Use https://letsencrypt.org to create a certificate for a single domain
# and store it in a Docker volume.

source env.sh

docker run -it --rm --name certbot \
    --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
    --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
    -v "${SECRETS_VOLUME}:/etc/letsencrypt" \
    -v "${SECRETS_VOLUME}:/var/lib/letsencrypt" \
    certbot/dns-route53 certonly \
    -d ${LETSENCRYPT_FQDN} \
    -m ${LETSENCRYPT_EMAIL} \
    --agree-tos --server https://acme-v02.api.letsencrypt.org/directory --dns-route53

# Set permissions so nobody can read the cert and key.
# Also symlink the certs into the root of the /etc/letsencrypt
# directory so that the FQDN doesn't have to be known later.

docker run --rm -it \
    -v "${SECRETS_VOLUME}":/etc/letsencrypt \
    ubuntu:20.04 \
    bash -c "ln -s /etc/letsencrypt/live/${LETSENCRYPT_FQDN}/* /etc/letsencrypt/ && \
        find /etc/letsencrypt -type d -exec chmod 755 {} +"