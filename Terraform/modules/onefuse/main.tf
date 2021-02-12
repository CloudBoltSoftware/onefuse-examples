module "name" {
    source = "./naming"
    policy = var.name_policy
    template_properties = var.template_properties
}

module "computer" {
    source = "./ad"
    policy = var.ad_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
}

module "ipam" {
    source = "./ipam"
    policy = var.ipam_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
}

module "dns" {
    source = "./dns"
    policy = var.dns_policy
    ip_address = module.ipam.ip_address
    dns_zones = module.name.dns_suffix
    hostname = module.name.hostname
    template_properties = var.template_properties
}
