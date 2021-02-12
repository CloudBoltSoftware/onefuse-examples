//OneFuse IPAM Terraform Module
module "ipam" {
    source = "../../../modules/onefuse/ipam"
    policy = "prodatl"
    hostname = var.hostname
    template_properties = var.template_properties
}