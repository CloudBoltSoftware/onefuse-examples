//OneFuse AD Terraform Module
module "computer" {
    source = "../../../modules/onefuse/ad"
    policy = "prod"
    hostname = var.hostname
    template_properties = var.template_properties
}