#!/bin/bash
host=$1

source auth.sh
source variables.sh

#
#
#  Crate DNS Policies
#
#

# Lookup EndPoint

    endPointId=$(curl -s -k "$onefuse_host/endpoints/?filter=name.iexact:$infobloxEndpoint" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.endpoints[0].id')

echo "$endPointId"

# Add IPAM Policy

    curl -s -k "$onefuse_host/dnsPolicies/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
            "type": "infoblox",
            "name": "infoblox851_dnspolicy",
            "description": "Infoblox 8.5.1 DNS Policy",
            "createARecord": false,
            "preValidateARecord": true,
            "postValidateARecord": true,
            "createPtrRecord": false,
            "preValidatePtrRecord": true,
            "postValidatePtrRecord": true,
            "postValidationSleepSeconds": "0",
            "validationTimeoutSeconds": "600",
            "hostnameOverride": "",
            "createHostRecord": true,
            "removeFixedAddressRecord": true,
	        "workspace": "'$workspace'",
            "endpoint": "/api/v3/onefuse/endpoints/'$endPointId'/"
            }'
