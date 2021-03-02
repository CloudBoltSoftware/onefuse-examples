# Pre-sales terraform demo examples

The examples contained in this repo are tied to the pre-sales demo environment.  The policies they are configured to consume can be changed to work with any environment, however you may also have to change the template_properties to support your specific configuration.  We will be releasing a demo data installer to install identical demo data as to what exists in the Pre-Sales soon.

To use these you will either have to add the following environment variables or create a terraform.tfvars files and place the .tfvar file into each plan folder.

## Environment Variables:

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

Basic usage examples of how to consume OneFuse Provider

**/example/onefuse-basic/naming-standalone**

```
terraform init
terraform plan
terraform apply --auto-approve
terraform destroy --auto-approve
```

**/example/onefuse-basic/ad-standalone**

```
terraform init
terraform plan -var="name=testname" 
terraform apply --auto-approve -var="name=testname"
terraform destroy --auto-approve -var="name=testname"
```

**/example/onefuse-basic/ipam-standalone**

```
terraform init
terraform plan -var="hostname=testname" 
terraform apply --auto-approve -var="hostname=testname"
terraform destroy --auto-approve -var="hostname=testname"
```

**/example/onefuse-basic/dns-standalone**

```
terraform init
terraform plan -var="hostname=testname" -var="dns_zones=dns.domain" -var="ip_address=1.1.1.1"
terraform apply --auto-approve -var="hostname=testname" -var="dns_zones=dns.domain" -var="ip_address=1.1.1.1"
terraform destroy --auto-approve -var="hostname=testname" -var="dns_zones=dns.domain" -var="ip_address=1.1.1.1"
```

**/example/onefuse-basic/onefuse-all**

```
terraform init
terraform plan
terraform apply --auto-approve
terraform destroy --auto-approve
```

**/example/onefuse-basic/onefuse-all-vsphere**

```
terraform init
terraform plan
terraform apply --auto-approve
terraform destroy --auto-approve
```