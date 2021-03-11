//OneFuse DNS Terraform Module
module "dns" {
    source = "github.com/CloudBoltSoftware/terraform-module-onefuse.git//dns"
    policy = var.policy
    hostname = var.hostname
    ip_address = var.ip_address
    dns_zones = var.dns_zones
    template_properties = var.template_properties
}