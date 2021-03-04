module "name" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//naming"
    policy = var.name_policy
    template_properties = var.template_properties
}

module "ad_computer" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ad"
    policy = var.ad_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
}

module "ipam" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ipam"
    policy = var.ipam_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
}

module "dns" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//dns"
    policy = var.dns_policy
    ip_address = module.ipam.ip_address
    dns_zones = module.name.dns_suffix
    hostname = module.name.hostname
    template_properties = var.template_properties
}
