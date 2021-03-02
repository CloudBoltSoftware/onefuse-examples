//OneFuse AD Terraform Module
module "computer" {
    source = "github.com/CloudBoltSoftware/terraform-demo.git/modules/onefuse//ad"
    policy = "prod"
    hostname = var.hostname
    template_properties = var.template_properties
}