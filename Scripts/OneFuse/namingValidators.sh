#!/bin/bash
host=$1

source auth.sh
source variables.sh

#
#
# Add Naming Validators
#
#

# Lookup Production DNS Endpoint

    endPointId=$(curl -s -k "$onefuse_host/endpoints/?filter=name.iexact:$prodDNS" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.endpoints[0].id')

# Add Production Naming Validator

    curl -s -k "$onefuse_host/validators/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        	"name": "DNS_Production",
        	"description": "Production DNS Validator",
        	"type": "dns",
        	"endpoint": "/api/v3/onefuse/endpoints/'$endPointId'/",
            "workspace": "'$workspace'"
            }'

# Lookup Development DNS Endpoint

    endPointId=$(curl -s -k "$onefuse_host/endpoints/?filter=name.iexact:$devDNS" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.endpoints[0].id')

# Add Development Naming Validator

    curl -s -k "$onefuse_host/validators/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        	"name": "DNS_Development",
        	"description": "Development DNS Validator",
        	"type": "dns",
        	"endpoint": "/api/v3/onefuse/endpoints/'$endPointId'/",
            "workspace": "'$workspace'"
            }'



# Lookup Development vRA8 Endpoint

    endPointId=$(curl -s -k "$onefuse_host/endpoints/?filter=name.iexact:$vRA8_devEndpointName" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.endpoints[0].id')

# Add Development vRA8 Naming Validator

    curl -s -k "$onefuse_host/validators/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        	"name": "vRA8_Development",
        	"description": "Development vRA8 Validator",
        	"type": "vra8",
        	"endpoint": "/api/v3/onefuse/endpoints/'$endPointId'/",
            "workspace": "'$workspace'"
            }'
