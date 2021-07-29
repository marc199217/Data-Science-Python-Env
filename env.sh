#!/bin/bash
# Set default values for environment variables required by notebook compose

: "${LETSENCRYPT_EMAIL=marc@nordbruch.me}"
export LETSENCRYPT_EMAIL

: "${LETSENCRYPT_FQDN=analytics.nordbruch.me}"
export LETSENCRYPT_FQDN

# Container name
: "${NAME:=python_container}"
export NAME

# Container secrets volume name
: "${SECRETS_VOLUME:=${NAME}-secrets}"
export SECRETS_VOLUME

