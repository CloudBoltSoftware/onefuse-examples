#!/bin/bash
host=$1

source auth.sh
source variables.sh

# Lookup Microsoft EndPoint

    endPointId=$(curl -s -k "$onefuse_host/endpoints/?filter=name.iexact:$microsoftEndpoint" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.endpoints[0].id')


# Add ADPolicy

    curl -s -k "$onefuse_host//microsoftADPolicies/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
                "name": "defaultAdPolicy",
                "id": 1,
                "description": "",
                "computerNameLetterCase": "LOWER",
                "buildOu": "OU=build,DC=2k19ad,DC=sovlabs,DC=net",
                "createBuildOu": true,
                "removeBuildOu": false,
                "ou": "OU=final,DC=2k19ad,DC=sovlabs,DC=net",
                "createOrganizationalUnit": true,
                "removeOrganizationalUnit": false,
                "deleteComputerAccountsByName": true,
                "securityGroups": [],
                "microsoftEndpoint": "/api/v3/onefuse/endpoints/'$endPointId'/",
                "workspace":"'$workspace'"
            }'
