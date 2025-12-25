#!/bin/bash

# env
export $(grep -v '^#' .env | xargs)

# ssh
KEY_PATH="./keys/poc_emr_flink.pem"
USER="hadoop"
ssh -i "$KEY_PATH" "$USER@$AWS_EMR_PRIMARY_NODE"