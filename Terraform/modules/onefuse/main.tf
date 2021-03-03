module "name" {
    source = "./naming"
    policy = var.name_policy
    template_properties = var.template_properties
    count = var.name_count
}

module "ad_computer" {
    source = "./ad"
    policy = var.ad_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
    count = var.ad_count
}

module "ipam" {
    source = "./ipam"
    policy = var.ipam_policy
    hostname = module.name.hostname
    template_properties = var.template_properties
    count = var.ipam_count
}

module "dns" {
    source = "./dns"
    policy = var.dns_policy
    ip_address = module.ipam.ip_address
    dns_suffix = module.name.dns_suffix
    hostname = module.name.hostname
    template_properties = var.template_properties
    count = var.dns_count
}
