#!/bin/bash
host=$1

source auth.sh
source variables.sh

#
#
# This section for DNS Endpoints
#
#

# Add Production DNS Endpoint

    curl -s -k "$onefuse_host/endpoints/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        		"type": "dns",
                "name": "'$prodDNS'",
                "description": "ProductionDNS",
                "host": "sovlabs.net",
                "port": 53,
	            "workspace": "'$workspace'"
            }'

# Add Development DNS Endpoint

    curl -s -k "$onefuse_host/endpoints/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        		"type": "dns",
                "name": "'$devDNS'",
                "description": "DevelopmentDNS",
                "host": "solarwinds45.sovlabs.net",
                "port": 53,
	            "workspace": "'$workspace'"
            }'
#
#
# Add vRA Endpoints
#
#

# Lookup vRA8 Credential

    endPointId=$(curl -s -k "$onefuse_host/moduleCredentials/?filter=name.iexact:$vRA8_credentialName" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.moduleCredentials[0].id')

#
#
#  Add vRA Endpoints
#
#

# Add vRA8 Endpoint

    curl -s -k "$onefuse_host/endpoints/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
                "type": "vra8",
                "name": "'$vRA8_devEndpointName'",
                "description": "Development_vRA8",
                "host": "vra81demo01.sovlabs.net",
                "port": 443,
                "ssl": true,
                "vraVersion": "8.1",
                "singleThreaded": true,
                "credential": "/api/v3/onefuse/moduleCredentials/'$endPointId'/",
                "vraOrganizationName": "VIDM81DEMO01",
	            "workspace": "'$workspace'"
            }'


#
#
# IPAM Endpoints
#
#

# Lookup Infoblox Credential

    endPointId=$(curl -s -k "$onefuse_host/moduleCredentials/?filter=name.iexact:$infoblox_credentialName" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.moduleCredentials[0].id')

echo "$endPointId"

# Add Infoblox Endpoint

    curl -s -k "$onefuse_host/endpoints/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
            "type": "infoblox",
            "name": "'$infobloxEndpoint'",
            "description": "Infoblox 8.5.1",
            "singleThreaded": true,
            "host": "infoblox851.sovlabs.net",
            "port": 443,
            "ssl": true,
            "infobloxVersion": "8.5",
            "dnsView": "default",
            "networkView": "default",
            "credential": "/api/v3/onefuse/moduleCredentials/'$endPointId'/",
	    "workspace": "'$workspace'"
            }'

#
# Microsoft Endpoints
#

# Lookup Microsoft Credential

    endPointId=$(curl -s -k "$onefuse_host/moduleCredentials/?filter=name.iexact:$microsoftCredential" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.moduleCredentials[0].id')


# Add Microsot Endpoint

    curl -s -k "$onefuse_host/endpoints/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
            "type": "microsoft",
            "name": "'$microsoftEndpoint'",
            "description": "Microsoft Test Endpoint",
            "singleThreaded": true,
            "host": "2k19ad-dc1.2k19ad.sovlabs.net",
            "port": 22,
            "ssl": true,
            "jumpHost": null,
            "jumpPort": null,
            "microsoftVersion": "2019",
            "temporaryDirectoryForScripts": "C:\\Windows\\temp",
            "sharePathForTemporaryDirectory": "",
            "credential": "/api/v3/onefuse/moduleCredentials/'$endPointId'/",
            "workspace":"'$workspace'"
            }'