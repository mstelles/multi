#!/bin/sh

# checking vars
if [ $AWSKEY ]; then
    if [ $AWSSEC ]; then
        mkdir $HOME/.aws
        echo "[default]" > $HOME/.aws/credentials
        echo "aws_access_key_id = $AWSKEY" > $HOME/.aws/credentials
        echo "iaws_secret_access_key = $AWSSEC" > $HOME/.aws/credentials
        if [ $REGION ]; then
            echo "[default]" > $HOME/.aws/config
            echo "region = $REGION" > $HOME/.aws/config
        fi
    fi
else
    echo "Not making any config for AWS CLI"
fi

echo "set -o vi" >> /etc/profile
