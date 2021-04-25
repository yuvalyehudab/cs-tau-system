#!/bin/bash
if [[ -z ${UDOCKER_DIR} ]]; then
	UDOCKER_DIR=/vol/scratch/`whoami`/udocker
fi
export UDOCKER_DIR

echo	'loading ...'

SCRIPT_DIR=`dirname $0`
CONTAINERS=`udocker ps | grep 'psql'`

if [[ -z ${CONTAINERS} ]]; then
	echo
	echo	"running 'from scratch'. pulling, creating and running container"
	echo	"also, installing postgres on the container"
	echo
	echo	"assuming run from directory cs-tau-system/ or provsql/"
	echo
	sleep 0.1

	RELEVANT_MONTH=`date +"%m"`
	RELEVANT_YEAR=`date +"%y"`
	if [ ${RELEVANT_MONTH} -le 10 ]; then
		RELEVANT_MONTH="04"
		if [ $RELEVANT_MONTH -le 4 ]; then
			RELEVANT_MONTH="10"
			RELEVANT_YEAR=`date --date='1 year ago' +"%y"`
		fi
	else
		RELEVANT_MONTH="10"
	fi
	echo	"pulling container ubuntu:latest. NOTE: last checked on ubuntu 20.10"
	echo	"latest ubuntu version is supposed to be: ${RELEVANT_YEAR}.${RELEVANT_MONTH}"
	echo
	echo	"running with:"
	echo	"udocker run --containerauth --publish=2345:5432 --volume=${SCRIPT_DIR}:/scripts psql bash /scripts/psql.sh"
	echo	"you can stop with:"
	echo	'udocker run --containerauth --publish=2345:5432 --volume=${UDOCKER_DIR}/../cs-tau-system/provsql:/scripts psql bash /scripts/stop-server.sh'
	echo	"leave the terminal open. connect from another terminal on the same server with (also in conn_check.py): "
	echo
	echo	"$ conda create -n check_conn or $ conda create --prefix=/path/to/env/check_conn"
	echo	"$ conda activate check_conn"
	echo	"$ conda install psycopg2"
	echo 	"$ python"
	echo
	echo	">>> import psycopg2"
	echo	">>> conn = psycopg2.connect(database='postgres', user='postgres', password=123, host='127.0.0.1', port=2345)"
	echo	">>> print(conn)"

	udocker pull ubuntu:latest > /dev/null 2>&1
	udocker create --name=psql ubuntu:latest
	udocker setup --execmode=P2 psql
	udocker run --containerauth --publish=2345:5432 --volume=`pwd`/${SCRIPT_DIR}:/scripts psql bash /scripts/psql.sh
	echo
else
	echo	"looks like the container already exist."
	echo
	echo	"to delete you can:"
	echo	'rm -rf ${UDOCKER_DIR}'
	echo
	echo	"to run with existing container you can:"
	echo	'udocker run --containerauth --publish=2345:5432 --volume=${UDOCKER_DIR}/../cs-tau-system/provsql:/scripts psql bash /scripts/run-server.sh'
	echo
	echo	"for more complicated cases, mail system@cs.tau.ac.il and link to the github repository"
	echo
fi