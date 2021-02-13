#!/bin/bash
host=$1

source auth.sh
source variables.sh

#
#
# Add Naming Policies
#
#

# Lookup Machine Sequence

    endPointId=$(curl -s -k "$onefuse_host/namingSequences/?filter=name.iexact:$machineSequence" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.namingSequences[0].id')

# Add machine Naming policy

    curl -s -k "$onefuse_host/namingPolicies/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        	"namingSequences": ["/api/v3/namingSequences/'$endPointId'"],
        	"name": "machineNaming",
        	"template": "{{nameEnvironment}}{{nameLocation}}{{nameApplication}}{{nameOS}}{{nameCompliance}}{{sequence.machineNamingSequence}}",
        	"validationPolicies": ["/api/v3/onefuse/validators/1/", "/api/v3/onefuse/validators/2/", "/api/v3/onefuse/validators/3/", "/api/v3/onefuse/validators/4/", "/api/v3/onefuse/validators/5/"],
        	"dnsSuffix": "sovlabs.net",
            "workspace": "'$workspace'"
            }'

# Lookup Deployment Sequence

    endPointId=$(curl -s -k "$onefuse_host/namingSequences/?filter=name.iexact:$deploymentSequence" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.namingSequences[0].id')

# Add Deployment Naming policy

    curl -s -k "$onefuse_host/namingPolicies/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        	"namingSequences": ["/api/v3/namingSequences/'$endPointId'"],
        	"name": "deploymentNaming",
        	"template": "{{{nameEnvironment}}{{nameApplication}}{{sequence.deploymentNamingSequence}}",
            "validationPolicies": [],
        	"dnsSuffix": "",
            "workspace": "'$workspace'"
            }'

# Lookup Machine Sequence

    endPointId=$(curl -s -k "$onefuse_host/namingSequences/?filter=name.iexact:$machineSequence" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.namingSequences[0].id')

# Add Production Naming policy

    curl -s -k "$onefuse_host/namingPolicies/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        	"namingSequences": ["/api/v3/namingSequences/'$endPointId'"],
        	"name": "Prod_Machine_Naming",
        	"template": "{{nameLocation | required}}{{nameEnv | required}}{{nameOs | required}}{{nameApp | required}}{{sequence.machineNamingSequence}}",
        	"validationPolicies": ["/api/v3/onefuse/validators/1/"],
        	"dnsSuffix": "sovlabs.net",
            "workspace": "'$workspace'"
            }'

# Lookup Machine Sequence

    endPointId=$(curl -s -k "$onefuse_host/namingSequences/?filter=name.iexact:$machineSequence" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.namingSequences[0].id')

# Add Development Naming policy

    curl -s -k "$onefuse_host/namingPolicies/" \
        -X POST -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
        -d '{
        	"namingSequences": ["/api/v3/namingSequences/'$endPointId'"],
        	"name": "Dev_Machine_Naming",
        	"template": "{{nameLocation | required}}{{nameEnv | required}}{{nameOs | required}}{{nameApp | required}}{{sequence.machineNamingSequence}}",
        	"validationPolicies": ["/api/v3/onefuse/validators/2/", "/api/v3/onefuse/validators/4/", "/api/v3/onefuse/validators/5/"],
        	"dnsSuffix": "sovlabs.net",
            "workspace": "'$workspace'"
            }'
