#!/bin/bash

UDOCKER_DIR=/vol/scratch/yuvalyehudab/udocker
export UDOCKER_DIR
udocker pull ubuntu:20.10 && \
	echo 'pulled' && \
	udocker create --name=psql ubuntu:20.10 && \
	echo 'created' && \
	udocker setup --execmode=P2 psql && \
	udocker run --containerauth --publish=2345:5432 psql psql.sh && \
	echo 'installed psql'
echo 'now udocker run --containerauth --publish=2345:5432 psql'
echo 'then service postgres restart'
echo 'then connect with: conn = psycopg2.connect("dbname=template1 user=yuvalyehudab password=123 host=127.0.0.1 port=2345")'
