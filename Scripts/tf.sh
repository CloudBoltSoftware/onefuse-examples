#!/bin/bash

while getopts e:a:c:f:d:h:o:p: flag

do
    case "${flag}" in
        e) env=${OPTARG};;
        a) app=${OPTARG};;
        f) function=${OPTARG};;
        d) deployment=${OPTARG};;
        h) help=${OPTARG};;
        o) os=${OPTARG};;
        p) project=${OPTARG};;
    esac

    case "${flag}" in
    c)
      components+=("$OPTARG")
      ;;
    *)
      ;;
    esac
done

get_application()
{
    get_token

    propertySetId=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/propertySets/?filter=name.iexact:$app" \
            -X GET -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" | jq -r '._embedded.propertySets[0].id')

    properties=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/propertySets/$propertySetId/" \
            -X GET -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" \
            -H "SOURCE: Terraform" \
           )

    components=$(echo "$properties" | jq -r '.properties.components')
}

#
# Function to get access token from OneFuse
#
get_token()
{
    token=$(curl -s -k 'https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/apiToken/' \
    -X POST -H 'Content-Type: application/json' \
    -d '{"username":"ssmith","password":"VmwareS0v"}' | jq -r '.token')
}

#
# Function to get deployment name from OneFuse
#
create_deployment()
{
            deployName=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/customNames/" \
            -X POST -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" \
            -H "SOURCE: Terraform" \
            -d '{
        "namingPolicy": "/api/v3/namingPolicies/2/",
        "templateProperties": {
                "deployNameEnv": "'$env'",
                "deployNameApp": "'$app'",
                "deployNameRequestSource": "TF"
                },
        "workspace":"/api/v3/workspaces/2/"
        }' | jq -r '.name')

     if [[ ! -d "${HOME}/terraform" ]]; then
        mkdir ${HOME}/terraform
     fi
     if [[ ! -d "${HOME}/terraform/bin" ]]; then
        mkdir ${HOME}/.terraform.d/bin
     fi

     if [ ! -z ${project} ] && [[ ! -d "${HOME}/terraform/$project" ]]; then
        mkdir ${HOME}/terraform/$project
        projectDir="$project"
    elif [ -z ${project} ] && [[ ! -d "${HOME}/terraform/deployments" ]]; then
        mkdir ${HOME}/terraform/deployments
        projectDir="deployments"
    elif [ -z ${project} ] && [[ -d "${HOME}/terraform/deployments" ]]; then
        projectDir="deployments"
    else
        echo "Project folder already exists"
         projectDir="$project"
    fi

        mkdir ${HOME}/terraform/$projectDir/$deployName
        ln -s ${HOME}/.terraform.d/variables.tf ${HOME}/terraform/$projectDir/$deployName
}
#
# Function to setup OneFuse provider in main.tf
#
initialize_oneFuse()
{

        echo "# OneFuse provider Info" > ./main.tf
        echo -e "provider \"onefuse\" {" >> ./main.tf
        echo " address     = var.onefuse_address" >> ./main.tf
        echo "  port        = var.onefuse_port" >> ./main.tf
        echo "  user        = var.onefuse_user" >> ./main.tf
        echo "  password    = var.onefuse_password" >> ./main.tf
        echo "  verify_ssl  = var.onefuse_verify_ssl" >> ./main.tf
        echo "}" >> ./main.tf
        echo -e "\n" >> ./main.tf

        echo -e "\n" >> ./main.tf
        echo " # vSphere Provider" >> ./main.tf
        echo " provider \"vsphere\" {" >> ./main.tf
        echo "      user = var.vsphere_user" >> ./main.tf
        echo "      password = var.vsphere_password" >> ./main.tf
        echo "      vsphere_server = var.vsphere_server" >> ./main.tf
        echo "          version = \"~> 1.20\"" >> ./main.tf
        echo "          allow_unverified_ssl = true" >> ./main.tf
        echo "}" >> ./main.tf
        echo -e "\n" >> ./main.tf
}

#
#  Function for adding naming resources for each component to be deployed
#

add_naming_resource()
{
        get_envProperties

        for component in "${components[@]}"; do

        IFS=: read -r app os cloud <<< "${component}"

        get_osProperties


        echo "# OneFuse Naming Resource" > ./$env-$app.tf
        echo -e "resource \"onefuse_naming\" \"my-onefuse-name-$env-$app\" {" >> ./$env-$app.tf
        echo "  naming_policy_id = \"$namePolicyId\"" >> ./$env-$app.tf
        echo "  template_properties = {" >> ./$env-$app.tf
        echo "  nameOs = \"$nameOs\"" >> ./$env-$app.tf
        echo "  nameEnv = \"$nameEnv\"" >> ./$env-$app.tf
        echo "  nameLocation = \"$loc\"" >> ./$env-$app.tf
        echo "  nameApp = \"$app\"" >> ./$env-$app.tf
        echo "  }" >> ./$env-$app.tf
        echo "}" >> ./$env-$app.tf
        echo -e "\n" >> ./$env-$app.tf

        case $cloud in
         vsphere)

            if [ -z ${deployName} ]; then
                deployName=$deployment
            fi

            echo "data \"vsphere_compute_cluster\" \"cluster-$env-$app\" {" >> ./$env-$app.tf
            echo "      name = \"Cluster1\"" >> ./$env-$app.tf
            echo "      datacenter_id = data.vsphere_datacenter.dc-$deployName.id" >> ./$env-$app.tf
            echo "}" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf

            echo "data \"vsphere_network\" \"network-$env-$app\" {" >> ./$env-$app.tf
            echo "       name = \"dvs_SovLabs_315_10.30.15.0_24\"" >> ./$env-$app.tf
            echo "       datacenter_id = data.vsphere_datacenter.dc-$deployName.id" >> ./$env-$app.tf
            echo "}" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf

            echo "data \"vsphere_virtual_machine\" \"template-$env-$app\" {" >> ./$env-$app.tf
            echo "      name = \"$template\"" >> ./$env-$app.tf
            echo "      datacenter_id = data.vsphere_datacenter.dc-$deployName.id" >> ./$env-$app.tf
            echo "}" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf

            echo " #Virtual Machine Resource" >> ./$env-$app.tf
            echo "resource \"vsphere_virtual_machine\" \"vsphere-$env-$app\" {" >> ./$env-$app.tf
            echo "    // Use OneFuse generated name for VM hostname and domain" >> ./$env-$app.tf
            echo "      name = onefuse_naming.my-onefuse-name-$env-$app.name" >> ./$env-$app.tf
            echo "      resource_pool_id = data.vsphere_compute_cluster.cluster-$env-$app.resource_pool_id" >> ./$env-$app.tf
            echo "  datastore_cluster_id = data.vsphere_datastore_cluster.datastore_cluster-$deployName.id" >> ./$env-$app.tf
            echo "      folder = vsphere_folder.deployment-$deployName.path" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf

            echo "  num_cpus = 1" >> ./$env-$app.tf
            echo "  memory   = 512" >> ./$env-$app.tf
            echo "   guest_id = data.vsphere_virtual_machine.template-$env-$app.guest_id" >> ./$env-$app.tf
            echo "  scsi_type = data.vsphere_virtual_machine.template-$env-$app.scsi_type" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf
            echo "  network_interface {" >> ./$env-$app.tf
            echo "     network_id   = data.vsphere_network.network-$env-$app.id" >> ./$env-$app.tf
            echo "     adapter_type = \"vmxnet3\"" >> ./$env-$app.tf
            echo "   }" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf

            echo "   disk {" >> ./$env-$app.tf
            echo "     label            = \"disk0\"" >> ./$env-$app.tf
            echo "     size             = data.vsphere_virtual_machine.template-$env-$app.disks.0.size" >> ./$env-$app.tf
            echo "     eagerly_scrub    = data.vsphere_virtual_machine.template-$env-$app.disks.0.eagerly_scrub" >> ./$env-$app.tf
            echo "     thin_provisioned = data.vsphere_virtual_machine.template-$env-$app.disks.0.thin_provisioned" >> ./$env-$app.tf
            echo "   }" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf
            if [ $os = linux ]; then
                echo "   clone {" >> ./$env-$app.tf
                echo "     template_uuid = data.vsphere_virtual_machine.template-$env-$app.id" >> ./$env-$app.tf
                echo "     customize {" >> ./$env-$app.tf
                echo "       linux_options {" >> ./$env-$app.tf
                echo "         host_name  = onefuse_naming.my-onefuse-name-$env-$app.name" >> ./$env-$app.tf
                echo "         domain = onefuse_naming.my-onefuse-name-$env-$app.dns_suffix" >> ./$env-$app.tf
            elif [ $os = windows ]; then
                echo "   clone {" >> ./$env-$app.tf
                echo "     template_uuid = data.vsphere_virtual_machine.template-$env-$app.id" >> ./$env-$app.tf
                echo "     customize {" >> ./$env-$app.tf
                echo "       windows_options {" >> ./$env-$app.tf
                echo "         computer_name  = onefuse_naming.my-onefuse-name-$env-$app.name" >> ./$env-$app.tf
                echo "         join_domain  = \"sovlabs.net\"" >> ./$env-$app.tf
                echo "         domain_admin_user  = \"vrasvc@sovlabs.net\"" >> ./$env-$app.tf
                echo "         domain_admin_password  = \"VmwareS0v\"" >> ./$env-$app.tf
            else
                echo "No operating System Defined"
            fi
            echo "       }" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf

            echo " network_interface {}" >> ./$env-$app.tf
            echo -e "\n" >> ./$env-$app.tf

            echo "     }" >> ./$env-$app.tf
            echo "   }" >> ./$env-$app.tf
            echo " }" >> ./$env-$app.tf

         ;;
        *)
            echo "No cloud provider selected"
        ;;
        esac
        done

        if [ $function = "deploy" ]; then
                folderStatus="$(cat ${HOME}/.terraform.d/bin/$project.vFolder.status)"

            if [ ! -z ${project} ] && [ "$folderStatus" != "exists" ]; then
                echo "resource \"vsphere_folder\" \"project\" {" >> ./vSphere.tf
                echo "      path = \"VRM-BACKUPEXCLUDED/pre-sales-demo/$project\"" >> ./vSphere.tf
                echo "      type = \"vm\"" >> ./vSphere.tf
                echo "      datacenter_id = data.vsphere_datacenter.dc-$deployName.id" >> ./vSphere.tf
                echo "}" >> ./vSphere.tf
                echo -e "\n" >> ./vSphere.tf

                echo "resource \"vsphere_folder\" \"deployment-$deployName\" {" >> ./vSphere.tf
                echo "      path = \"\${vsphere_folder.project.path}/$deployName\"" >> ./vSphere.tf
                echo "      type = \"vm\"" >> ./vSphere.tf
                echo "      datacenter_id = data.vsphere_datacenter.dc-$deployName.id" >> ./vSphere.tf
                echo "}" >> ./vSphere.tf
                echo -e "\n" >> ./vSphere.tf
                echo "exists" > ${HOME}/.terraform.d/bin/$project.vFolder.status
            elif [ ! -z ${project} ] && [ "$folderStatus" = "exists" ]; then
                echo " Project already exists, using existing project folder"
                echo "resource \"vsphere_folder\" \"deployment-$deployName\" {" >> ./vSphere.tf
                echo "      path = \"VRM-BACKUPEXCLUDED/pre-sales-demo/$project/$deployName\"" >> ./vSphere.tf
                echo "      type = \"vm\"" >> ./vSphere.tf
                echo "      datacenter_id = data.vsphere_datacenter.dc-$deployName.id" >> ./vSphere.tf
                echo "}" >> ./vSphere.tf
                echo -e "\n" >> ./vSphere.tf
            else
                echo "resource \"vsphere_folder\" \"deployment-$deployName\" {" >> ./vSphere.tf
                echo "      path = \"VRM-BACKUPEXCLUDED/pre-sales-demo/deployments/$deployName\"" >> ./vSphere.tf
                echo "      type = \"vm\"" >> ./vSphere.tf
                echo "      datacenter_id = data.vsphere_datacenter.dc-$deployName.id" >> ./vSphere.tf
                echo "}" >> ./vSphere.tf
                echo -e "\n" >> ./vSphere.tf
            fi

                        echo " #Data Sources" >> ./vSphere.tf
            echo " data \"vsphere_datacenter\" \"dc-$deployName\" {" >> ./vSphere.tf
            echo "      name = \"SovLabs\"" >> ./vSphere.tf
            echo "}" >> ./vSphere.tf
            echo -e "\n" >> ./vSphere.tf

            echo "data \"vsphere_datastore_cluster\" \"datastore_cluster-$deployName\" {" >> ./vSphere.tf
            echo "      name = \"SovLabs_XtremIO\"" >> ./vSphere.tf
            echo "      datacenter_id = data.vsphere_datacenter.dc-$deployName.id" >> ./vSphere.tf
            echo "}" >> ./vSphere.tf
            echo -e "\n" >> ./vSphere.tf
        fi


        #initialize Terraform
        terraform init

        terraform plan -out="plan.out"
        terraform apply "plan.out"

}

#
# Lookup name ID for deployment name
#

get_deployment_nameId()
{
    nameId=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/customNames/?filter=name.iexact:$deployment" \
        -X GET -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" | jq -r '._embedded.customNames[0].id')
}

#
# Destroy Deployment Name in OneFuse
#

destroy_deployment_name()
{
    curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/customNames/$nameId/" \
        -X DELETE -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $token" \
            -d '{
               "namingPolicy": "/api/v3/namingPolicies/2/",
               "templateProperties": {
                "deployNameEnv": "'$env'",
                "deployNameApp": "'$app'",
                "deployNameRequestSource": "TF"
                },
        "workspace":"/api/v3/workspaces/2/"
}'
}

#
# Function to destroy naming resource for each component deployed
#
destroy_naming_resource()
{
    for component in "${components[@]}"; do
        rm $env-"${component}".tf
            terraform plan -out="plan.out"
            terraform apply "plan.out"
    done


    if [ -z ${component} ]; then
        allEnvApps=($(terraform state list | grep onefuse_naming.my-onefuse-name-"$env" | sed 's/^onefuse_naming.my-onefuse-name-'$env'-//'))

        for envApps in "${allEnvApps[@]}"; do
            rm $env-$envApps.tf
        done

        terraform plan -out="plan.out"
        terraform apply "plan.out"
    fi


    if [ -z ${component} ] && [ -z ${env} ]; then
        terraform destroy -auto-approve
    fi

    result=$(terraform state list)

    if [ -z ${result} ]; then
        rm -Rf ${HOME}/terraform/$project/$deployment
        get_token
        get_deployment_nameId
        destroy_deployment_name
        echo "$result"
    else
       echo "$result"
    fi

    result="$(ls ${HOME}/terraform/$project/)"

    if [ -z ${result} ]; then
        rm -Rf ${HOME}/terraform/$project
        if [ $project != deployments ]; then
        rm ${HOME}/terraform/bin/$project.vFolder.status
        fi
        echo "Project $project has been removed"
    else
       echo "Project still contains:

       $result"
    fi
}
show_resource_state()
{
for component in "${components[@]}"; do

    if [ -z ${component} ] && [ -z ${env} ]; then
        echo "No Components added"
    else
        terraform state show onefuse_naming.my-onefuse-name-$env-$component
    fi
 done

        if [ -z ${component} ] && [ -z ${env} ]; then
        terraform show
        fi
}



get_envProperties()
{
get_token

propertySetId=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/propertySets/?filter=name.iexact:$env" \
            -X GET -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" | jq -r '._embedded.propertySets[0].id')

properties=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/propertySets/$propertySetId/" \
            -X GET -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" \
            -H "SOURCE: Terraform" \
           )

loc=$(echo "$properties" | jq -r '.properties.location')
namePolicyId=$(echo "$properties" | jq -r '.properties.nameId')
nameEnv=$(echo "$properties" | jq -r '.properties.nameEnv')
}


get_osProperties()
{
get_token

propertySetId=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/propertySets/?filter=name.iexact:$os" \
            -X GET -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" | jq -r '._embedded.propertySets[0].id')

properties=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/propertySets/$propertySetId/" \
            -X GET -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" \
            -H "SOURCE: Terraform" \
           )

template=$(echo "$properties" | jq -r '.properties.template')
nameOs=$(echo "$properties" | jq -r '.properties.nameOs')
}

get_application()
{
    get_token

    propertySetId=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/propertySets/?filter=name.iexact:$app" \
            -X GET -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" | jq -r '._embedded.propertySets[0].id')

    properties=$(curl -s -k "https://presales-onefuse01.sovlabs.net:443/api/v3/onefuse/propertySets/$propertySetId/" \
            -X GET -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $token" \
            -H "SOURCE: Terraform" \
           )

    components_result=$(echo "$properties" | jq -r '.properties.components')
    read -a components <<< "${components_result}"

}

#######     Begin Script   #######
# Case statement to determine what action should be taken: deploy, add, or destroy
#
case "$function" in
    deploy)

        # Get OneFuse Token
        get_token

        # Get deployment name and create deployment folder
        create_deployment $token

        # Change to deployment folder
        cd ${HOME}/terraform/$projectDir/$deployName/

        # Add OneFuse provider to main.tf
        initialize_oneFuse

        # Add name for each requested resource

        if [ -z ${env} ]; then
            echo "
            Environment is a required input using the -e option.
            "
        elif [ -z ${app} ]; then
            echo"
            Application is rquired using the -a option
            "
        else

        if [ -z ${components} ]; then
           get_application
        fi
