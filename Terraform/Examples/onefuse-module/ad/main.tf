//OneFuse AD Terraform Module
module "computer" {
    source = "github.com/CloudBoltSoftware/terraform-module-onefuse.git//ad"
    policy = var.policy
    hostname = var.hostname
    template_properties = var.template_properties
}