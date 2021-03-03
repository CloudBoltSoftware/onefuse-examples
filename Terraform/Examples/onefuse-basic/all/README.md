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

//vSphere Provider Info
vsphere_server = ""
vsphere_user = ""
vsphere_password = ""
```

## Usage

### /examples/onefuse-basic

Usage examples of how to consume OneFuse Terraform Provider

```
terraform init
terraform plan
terraform apply --auto-approve
terraform destroy --auto-approve
```