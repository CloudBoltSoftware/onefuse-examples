module "onefuse" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse"
    name_policy = var.name_policy
    name_count = var.name_count
    ipam_policy = var.ipam_policy
    ipam_count = var.ipamm_count
    dns_policy = var.dns_policy
    dns_count = var.dns_count
    ad_policy = var.ad_policy
    ad_count = var.ad_count
    template_properties = var.template_properties
}