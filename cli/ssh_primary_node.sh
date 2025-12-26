#!/bin/bash

# env
export $(grep -v '^#' .env | xargs)

# key & user
KEY_PATH="./keys/poc_emr_flink.pem"
USER="hadoop"

# run command
if [ "$#" -eq 1 ]; then
    ssh -i "$KEY_PATH" "$USER@$AWS_EMR_PRIMARY_NODE" "$1"

# ssh tunnel
elif [ "$#" -eq 3 ]; then
    LOCAL_PORT=$1
    REMOTE_IP=$2
    REMOTE_PORT=$3
    ssh -i "$KEY_PATH" -NL "$LOCAL_PORT:$REMOTE_IP:$REMOTE_PORT" "$USER@$AWS_EMR_PRIMARY_NODE"

# ssh
else
    ssh -i "$KEY_PATH" "$USER@$AWS_EMR_PRIMARY_NODE"
fi