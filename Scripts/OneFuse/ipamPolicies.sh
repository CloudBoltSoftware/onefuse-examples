#!/bin/bash
host=$1

source auth.sh
source variables.sh

#
#
#  Add IPAM Policies
#
#

# Lookup EndPoint

    endPointId=$(curl -s -k "$onefuse_host/endpoints/?filter=name.iexact:$infobloxEndpoint" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.endpoints[0].id')

echo "$endPointId"

# Add IPAM Policy

    curl -s -k "$onefuse_host/ipamPolicies/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        "type": "infoblox",
            "name": "infoblox851_ipampolicy",
            "description": "Infoblox 8.5.1 Policy",
            "subnets": [
                {
                    "subnet": "10.30.29.0/24",
                    "gateway": "10.30.29.1",
                    "network": "dvs_SovLabs_329_10.30.29.0_24",
                    "netmask": "255.255.255.0"
                },
                {
                    "subnet": "10.30.30.0/24",
                    "gateway": "10.30.30.1",
                    "network": "dvs_SovLabs_330_10.30.30.0_24",
                    "netmask": "255.255.255.0"
                }
            ],
	    "workspace": "'$workspace'",
        "endpoint": "/api/v3/onefuse/endpoints/'$endPointId'/"
            }'
