# Terraform Basic Examples

The examples contained in this repo are tied to the OneFuse Terraform provider.  For more information or to assistance with the OneFuse Terraform provider or examples please visit the [OneFuse Community](https://onefuse.cloudbolt.io/).

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

//Resource Inputs
ipam_policy = ""
naming_policy = ""
ad_policy = ""
dns_policy = ""
script_policy = ""
```

## Usage

### /examples/onefuse-basic

Usage examples of how to consume OneFuse Terraform Provider

```
terraform init
terraform plan -var="ipam_policy=policyname" -var="naming_policy=policyname" -var="ad_policy=policyname" -var="dns_policy=policyname" -var="script_policy=policyname"
terraform apply --auto-approve -var="ipam_policy=policyname" -var="naming_policy=policyname" -var="ad_policy=policyname" -var="dns_policy=policyname" -var="script_policy=policyname"
terraform destroy --auto-approve -var="ipam_policy=policyname" -var="naming_policy=policyname" -var="ad_policy=policyname" -var="dns_policy=policyname" -var="script_policy=policyname"
```