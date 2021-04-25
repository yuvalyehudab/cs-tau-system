#!/bin/bash

# stop-server.sh
# usage 1: bash /scripts/stop-server.sh
# usage 2: udocker run --containerauth --publish=2345:5432 --volume=${UDOCKER_DIR}/../cs-tau-system/provsql:/scripts psql bash /scripts/stop-server.sh

echo "stop-server.sh - shutting the postgres server down"
echo 

echo "pg_lsclusters: "
pg_lsclusters
echo

echo 'su postgres -c "pg_ctlcluster 12 main stop"'
echo
su postgres -c "pg_ctlcluster 12 main stop"
echo "pg_lsclusters: "
pg_lsclusters
echo
echo 'Done!'
echo 