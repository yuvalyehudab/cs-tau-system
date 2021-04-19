#!/bin/bash

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

if [[ -z ${POSTGRES_PASSWORD}]]; then
    export POSTGRES_PASSWORD=123
fi

apt update && apt upgrade -y
apt install -y less git wget curl vim nano build-essential python3 libssl-dev dropbear postgresql postgresql-contrib

su postgres -c 'pg_createcluster 12 main -- --username=postgres --pwfile=<(echo ${POSTGRES_PASSWORD})'
chmod 0600 /etc/ssl/private/ssl-cert-snakeoil.key
su postgres -c 'pg_ctlcluster 12 main start'

# https://stackoverflow.com/a/18664239

su postgres -c 'service postgresql restart'
