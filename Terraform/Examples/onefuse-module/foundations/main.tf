module "onefuse" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse"
    name_policy = var.name_policy
    ipam_policy = var.ipam_policy
    dns_policy = var.dns_policy
    ad_policy = var.ad_policy
    template_properties = var.template_properties
}