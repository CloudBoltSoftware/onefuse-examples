//OneFuse IPAM Terraform Module
module "ipam" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ipam"
    policy = var.policy
    hostname = var.hostname
    template_properties = var.template_properties
}