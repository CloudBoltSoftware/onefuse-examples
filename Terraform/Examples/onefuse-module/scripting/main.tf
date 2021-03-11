//OneFuse Scripting Terraform Module
module "script" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//scripting?ref=v1.2-beta.1"
    policy = var.policy
    template_properties = var.template_properties
}