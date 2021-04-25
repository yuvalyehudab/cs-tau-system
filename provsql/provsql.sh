#!/bin/bash

UDOCKER_DIR=/vol/scratch/`whoami`/udocker
export UDOCKER_DIR

echo	'loading ...'

SCRIPT_DIR=`dirname $0`
CONTAINERS=`udocker ps | grep 'psql'`

if [[ -z ${CONTAINERS} ]]; then
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
	echo	"pull container ubuntu:latest. NOTE: last check on ubuntu 20.10"
	echo	"latest ubuntu version is supposed to be: ${RELEVANT_YEAR}.${RELEVANT_MONTH}"
	echo	"udocker run --containerauth --publish=2345:5432 --volume=${SCRIPT_DIR}:/scripts psql bash /scripts/psql.sh"
	echo	"leave the terminal open. connect from another terminal on the same server with: "
	echo	"$ conda create -n check_conn or $ conda create --prefix=/path/to/env/check_conn"
	echo	"$ conda activate check_conn"
	echo	"$ conda install psycopg2"
	echo 	"$ python"
	echo	">>> import psycopg2"
	echo	">>> conn = psycopg2.connect(database='postgres', user='postgres', password=123, host='127.0.0.1', port=2345)"
	echo	">>> print(conn)"

	udocker pull ubuntu:latest > /dev/null 2>&1
	udocker create --name=psql ubuntu:latest
	udocker setup --execmode=P2 psql
	udocker run --containerauth --publish=2345:5432 --volume=`pwd`/${SCRIPT_DIR}:/scripts psql bash /scripts/psql.sh
fi