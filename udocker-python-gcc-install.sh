#!/bin/bash
#change to tcsh?
echo "creating a container"
echo "initialize"
username=$(whoami)
echo "here"
echo "user: $username"
BASE_DIR=/specific/scratches/scratch
echo "base dir: $BASE_DIR"

# set working directory
# default: $(BASE_DIR)/$(username)/udocker
# optional: $1/udocker
# only if udocker working directory was not set explicitly by username/shell

# test:
# run script
# echo $UDOCKER_DIR
if [[ -z $UDOCKER_DIR ]]; then
    if [[ -z $1 ]]; then
        export UDOCKER_DIR=$BASE_DIR/$username/udocker
    else
        export UDOCKER_DIR=$1/udocker
    fi
fi
