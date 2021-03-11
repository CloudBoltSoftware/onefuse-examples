//OneFuse IPAM Terraform Module
module "ipam" {
    source = "github.com/CloudBoltSoftware/terraform-module-onefuse.git//ipam"
    policy = var.policy
    hostname = var.hostname
    template_properties = var.template_properties
}