module "onefuse" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git?ref=v1.2-beta.1"
    name_policy = var.name_policy
    ipam_policy = var.ipam_policy
    dns_policy = var.dns_policy
    ad_policy = var.ad_policy
    template_properties = var.template_properties
}