#!/bin/bash

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

apt update
apt upgrade -y
apt install less git wget curl vim nano build-essential python3 libssl-dev dropbear
apt install postgresql postgresql-contrib

su postgres
pg_ctlcluster 12 main start
chmod 0600 /etc/ssl/private/ssl-cert-snakeoil.key
# fix file /etc/postgresql/12/main/pg_hba.conf
# https://stackoverflow.com/a/18664239
# pg_createcluster 12 main --start # maybe comment out --start ?
service postgresql restart
