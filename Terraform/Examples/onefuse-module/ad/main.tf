//OneFuse AD Terraform Module
module "computer" {
    source = "https://github.com/CloudBoltSoftware/onefuse-examples.git/modules/onefuse//ad"
    policy = "prod"
    hostname = var.hostname
    template_properties = var.template_properties
}