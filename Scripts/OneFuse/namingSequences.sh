#!/bin/bash
host=$1

source auth.sh
source variables.sh

#
#
# Add Naming Sequences
#
#

# Add Machine Naming Sequence

    curl -s -k "$onefuse_host/namingSequences/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
            "initialValue": "1",
            "type": "BASE10",
            "reuse": false,
            "length": 3,
            "pad": "0",
            "uniqueKey": "{{nameEnvironment}}{{nameLocation}}{{nameApplication}}{{nameOS}}{{nameCompliance}}",
            "_namingData": "{}",
            "name": "'$machineSequence'",
            "workspace": "'$workspace'"
            }'

# Add Deployment Naming Sequence

    curl -s -k "$onefuse_host/namingSequences/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
            "initialValue": "1",
            "type": "BASE10",
            "reuse": false,
            "length": 3,
            "pad": "0",
            "uniqueKey": "{{nameEnvironment}}{{nameApplication}}",
            "_namingData": "{}",
            "name": "'$deploymentSequence'",
            "workspace": "'$workspace'"
            }'