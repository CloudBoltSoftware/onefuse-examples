//OneFuse IPAM Terraform Module
module "ipam" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ipam"
    policy = var.policy
    hostname = var.hostname
    template_properties = var.template_properties
}