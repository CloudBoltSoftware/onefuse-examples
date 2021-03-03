//OneFuse AD Terraform Module
module "computer" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ad"
    policy = "prod"
    hostname = var.hostname
    template_properties = var.template_properties
}