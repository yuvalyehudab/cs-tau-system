#!/bin/bash

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

apt update
apt upgrade -y
apt install less git wget curl vim nano build-essential python3 libssl-dev dropbear
apt install postgresql postgresql-contrib
su postgres
chmod 0600 /etc/ssl/private/ssl-cert-snakeoil.key
pg_ctlcluster 12 main start
service postgresql restart
