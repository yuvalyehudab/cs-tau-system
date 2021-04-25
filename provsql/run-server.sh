#!/bin/bash

# run-server.sh
# use when everything already installed
# usage 1: bash /scripts/run-server.sh
# usage 2: udocker run --containerauth --publish=2345:5432 --volume=${UDOCKER_DIR}/../cs-tau-system/provsql:/scripts psql bash /scripts/run-server.sh

echo "run-server.sh - running postgres server"
echo 

echo "pg_lsclusters: "
pg_lsclusters
echo

echo 'su postgres -c "pg_ctlcluster 12 main start"'
echo
su postgres -c "pg_ctlcluster 12 main start"
echo "pg_lsclusters: "
pg_lsclusters
echo
echo 'Done!'
echo 