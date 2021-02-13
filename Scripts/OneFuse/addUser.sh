#!/bin/bash
host=$1
host=$2
host=$3

username=$2
password=$3
source auth.sh
source variables.sh

# Create Local User ssmith

    curl -s -k "$onefuse_host/users/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
                "configurationAdmin": true,
                "username": "ssmith",
                "firstName": "Sid",
                "lastName": "Smith",
                "email": "'$username'",
                "password": "'$password'",
                "source": null
            }'

# Addto workspace

    curl -s -k "$onefuse_host/workspaceMemberships/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
            	"role": "admin",
            	"user": "/api/v3/users/2/",
                "workspace": "'$workspace'"
            }'
