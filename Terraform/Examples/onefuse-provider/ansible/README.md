# Terraform Provider Examples

The examples contained in this repo are tied to the OneFuse Terraform provider.  For more information or to assistance with the OneFuse Terraform provider or examples please visit the [OneFuse Community](https://onefuse.cloudbolt.io/).

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
policy = ""
hostname = ""
dns_suffix = ""
template_properties = ""

//Rename sample.tfvars_sample -> sample.tfvars and fill out the appropriate values.
terraform apply --auto-approve -var-file="sample.tfvars"

```



## Usage

### /examples/onefuse-basic

Usage examples of how to consume OneFuse Terraform Provider

```
terraform init
terraform plan -var="hostname=testname" 
terraform apply --auto-approve -var="hostname=testname" -var="policy=policy_name"
terraform destroy --auto-approve -var="hostname=testname" -var="policy=policy_name"
```