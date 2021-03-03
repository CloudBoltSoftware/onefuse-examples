//OneFuse IPAM Terraform Module
module "ipam" {
    source = "https://github.com/CloudBoltSoftware/onefuse-examples.git/modules/onefuse//ipam"
    policy = "prodatl"
    hostname = var.hostname
    template_properties = var.template_properties
}