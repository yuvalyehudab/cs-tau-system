#!/bin/bash

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

if [[ -z ${POSTGRES_PASSWORD} ]]; then
    export POSTGRES_PASSWORD=123
fi

echo "========== 1 =========" &&
echo "========== 2 ========="

# echo "========== 1 ========="
echo "========== 3 ========="
apt update && apt upgrade -y > /dev/null 2>&1 && \
apt install -y less git wget curl vim nano build-essential python3 libssl-dev dropbear postgresql postgresql-contrib > /dev/null 2>&1 ;
echo "========== 4 =========" && \
su postgres -c 'pg_createcluster 12 main -- --username=postgres --pwfile=<(echo ${POSTGRES_PASSWORD})';
echo "========== 4.5 ========="
chmod 0600 /etc/ssl/private/ssl-cert-snakeoil.key &&
echo "========== 5 =========" &&
su postgres -c 'pg_ctlcluster 12 main start';

# https://stackoverflow.com/a/18664239

su postgres -c 'service postgresql restart';
echo 'to exit, pls run: service postgresql stop' 