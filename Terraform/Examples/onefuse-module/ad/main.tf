//OneFuse AD Terraform Module
module "computer" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ad?ref=v1.2-beta.1"
    policy = var.policy
    hostname = var.hostname
    template_properties = var.template_properties
}
