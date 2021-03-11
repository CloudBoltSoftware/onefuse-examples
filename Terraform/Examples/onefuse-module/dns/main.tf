//OneFuse DNS Terraform Module
module "dns" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//dns?ref=v1.2-beta.1"
    policy = var.policy
    hostname = var.hostname
    ip_address = var.ip_address
    dns_zones = var.dns_zones
    template_properties = var.template_properties
}