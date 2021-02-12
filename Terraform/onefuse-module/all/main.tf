//OneFuse naming Terraform Module
module "name" {
    source = "../../../modules/onefuse/naming"
    policy = "machine"
    template_properties = var.template_properties
}

//OneFuse AD Terraform Module
module "computer" {
    source = "../../../modules/onefuse/ad"
    policy = "prod"
    hostname = module.name.hostname
    template_properties = var.template_properties
}

//OneFuse IPAM Terraform Module
module "ipam" {
    source = "../../../modules/onefuse/ipam"
    policy = "atlprod"
    hostname = module.name.hostname
    template_properties = var.template_properties
}

//OneFuse DNS Terraform Module
module "dns" {
    source = "../../../modules/onefuse/dns"
    policy = "prod"
    ip_address = module.ipam.ip_address
    dns_zones = module.name.dns_suffix
    hostname = module.name.hostname
    template_properties = var.template_properties
}
