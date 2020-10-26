#!/bin/bash

user=$(whoami)
BASE_DIR=/specific/scratches/scratch

if [[ -z $UDOCKER_DIR]]; then
    if [[ -z $1 ]]; then
        export UDOCKER_DIR=$(BASE_DIR)/$user/udocker
    else
        export UDOCKER_DIR=$1/udocker
    fi
fi
