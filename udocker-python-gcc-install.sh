#!/bin/bash

user=$(whoami)
BASE_DIR=/specific/scratches/scratch

# set working directory
# default: $(BASE_DIR)/$(user)/udocker
# optional: $1/udocker
# only if udocker working directory was not set explicitly by user/shell

# test:
# run script
# echo $UDOCKER_DIR
if [[ -z $UDOCKER_DIR]]; then
    if [[ -z $1 ]]; then
        export UDOCKER_DIR=$(BASE_DIR)/$(user)/udocker
    else
        export UDOCKER_DIR=$1/udocker
    fi
fi
