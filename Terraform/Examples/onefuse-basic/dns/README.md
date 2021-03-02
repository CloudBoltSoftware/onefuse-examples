# Terraform Module Examples

The examples contained in this repo are tied to the OneFuse Terraform module also available in this repo.  For more information or to assistance with this module or example please visit the [OneFuse Community](https://onefuse.cloudbolt.io/).

## Environment Variables if you want to use them:

```
//OneFuse Provider Info
TF_VAR_onefuse_address
TF_VAR_onefuse_port
TF_VAR_onefuse_user
TF_VAR_onefuse_password

//vSphere Provider Info
TF_VAR_vsphere_server
TF_VAR_vsphere_user
TF_VAR_vsphere_password
```

## terraform.tfvars example

```
//OneFuse Provider Info
onfuse_address = ""
onefuse_port = ""
onefuse_user = ""
onefuse_password = ""

//vSphere Provider Info
vsphere_server = ""
vsphere_user = ""
vsphere_password = ""
```

## Usage

### /examples/onefuse-module

Usage examples of how to consume OneFuse Terraform Module

```
terraform init
terraform plan -var="hostname=testname" -var="dns_zones=dns.domain" -var="ip_address=1.1.1.1"
terraform apply --auto-approve -var="hostname=testname" -var="dns_zones=dns.domain" -var="ip_address=1.1.1.1"
terraform destroy --auto-approve -var="hostname=testname" -var="dns_zones=dns.domain" -var="ip_address=1.1.1.1"
```