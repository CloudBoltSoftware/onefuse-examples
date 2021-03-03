//OneFuse DNS Terraform Module
module "dns" {
    source = "https://github.com/CloudBoltSoftware/onefuse-examples.git/modules/onefuse//dns"
    policy = "prod"
    hostname = var.hostname
    ip_address = var.ip_address
    dns_zones = var.dns_zones
    template_properties = var.template_properties
}