#!/bin/bash
host=$1

source auth.sh
source variables.sh

#
#
# Add Static Property Sets
#
#

# Add Atlanta_Prod_Lin_App static property set

    curl -s -k "$onefuse_host/propertySets/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
                "name": "Atlanta_Prod_Lin_App",
                "type": "static",
                "description": "Production Linux Application Atlanta",
                "workspace": "'$workspace'",
                "properties": {
                      "nameDatacenter": "atl",
                      "nameEnv": "prod",
                      "nameOs": "l",
                      "nameApp": "app",
                      "nameDomain": "sovlabs.net",
                      "nameLocation": "atl"
                }
            }'

