# Terraform Module Examples

The examples contained in this repo are tied to the OneFuse Terraform module also available in this repo.  For more information or to assistance with this module or example please visit the [OneFuse Community](https://onefuse.cloudbolt.io/).

## Environment Variables if you want to use them:

```
//OneFuse Provider Info
TF_VAR_onefuse_address
TF_VAR_onefuse_port
TF_VAR_onefuse_user
TF_VAR_onefuse_password

```

## terraform.tfvars example

```
//OneFuse Provider Info
onfuse_address = ""
onefuse_port = ""
onefuse_user = ""
onefuse_password = ""

//Resource Inputs
property_set = ""
template_properties = ""

//Rename sample.tfvars_sample -> sample.tfvars and fill out the appropriate values.
terraform apply --auto-approve -var-file="sample.tfvars"
```

## Files

```
main.tf = Main configuration file consuming OneFuse Terraform Module
output.tf = Defines the outputs from the configuration
provider.tf = Where all the provider blocks are configured
properties.tf = Where proeprty toolkit operations are configured
variables.tf = Inputs and default variable values
```

## Usage

### /examples/onefuse-module

Usage examples of how to consume OneFuse Terraform Module

```
terraform init
terraform plan
terraform apply --auto-approve -var="property_set=property_set_name"
```