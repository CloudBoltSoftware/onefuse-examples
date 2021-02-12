//OneFuse consolidate terraform module
module "onefuse" {
    source = "../../../modules/onefuse"
    name_policy = var.name_policy
    ad_policy = var.ad_policy
    ipam_policy = var.ipam_policy
    dns_policy = var.dns_policy
    template_properties = var.template_properties
}