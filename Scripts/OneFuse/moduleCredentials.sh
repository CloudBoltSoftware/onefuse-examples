#!/bin/bash
host=$1

source auth.sh
source variables.sh

#
#
# This Section for adding credentials
#
#

# Add vRA8 Credentials

    curl -s -k "$onefuse_host/moduleCredentials/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        		"name": "'$vRA8_credentialName'",
	            "description": "vRA8 Credentials",
	            "username": "'$vra8user'",
	            "password": "'$vrapass'",
	            "endpointType": "vra8",
	            "workspace": "'$workspace'",
                "connectionMethod": "basic"
            }'

# Add Infoblox Credentials

    curl -s -k "$onefuse_host/moduleCredentials/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        		"name": "'$infoblox_credentialName'",
	            "description": "Infoblox851 Credentials",
	            "username": "'$infobloxuser'",
	            "password": "'$infobloxpass'",
	            "endpointType": "infoblox",
	            "workspace":"'$workspace'",
                "connectionMethod": "basic"
            }'

# Add Microsot Credential

    curl -s -k "$onefuse_host/moduleCredentials/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
                "name": "'$microsoftCredential'",
                "description": "Microsoft Admin User",
                "username": "'$microsoftUser'",
	            "password": "'$microsoftPass'",
                "endpointType": "microsoft",
                "workspace":"'$workspace'",
                "connectionMethod": "openssh"
            }'
