#!/bin/bash

onefuse_host="https://$host/api/v3/onefuse"

#Get OneFuse Auth Token
    token=$(curl -s -k "$onefuse_host/apiToken/" \
        -X POST -H 'Content-Type: application/json' \
        -d '{"username":"admin","password":"admin"}' | jq -r '.token')