#!/bin/bash

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

if [[ -z ${POSTGRES_PASSWORD} ]]; then
    export POSTGRES_PASSWORD=123
fi

apt update > /dev/null 2>&1 && apt upgrade -y > /dev/null 2>&1 && \
apt install -y less git wget curl vim nano build-essential python3 libssl-dev dropbear postgresql postgresql-contrib > /dev/null 2>&1 ;

su postgres -c "pg_createcluster 12 main -- --username=postgres --pwfile=<(echo ${POSTGRES_PASSWORD})";

chmod 0600 /etc/ssl/private/ssl-cert-snakeoil.key
su postgres -c 'pg_ctlcluster 12 main start';

# https://stackoverflow.com/a/18664239

su postgres -c 'service postgresql restart';
echo    'to exit, pls run: service postgresql stop' 
echo    'or: su postgres -c "pg_ctlcluster 12 main stop"'
echo    'or: bash /scripts/stop-server.sh'
echo
echo    "if you are not inside the container, use:"
echo    'docker run --containerauth --publish=2345:5432 --volume=${UDOCKER_DIR}/../cs-tau-system/provsql:/scripts psql bash /scripts/stop-server.sh'
echo
