//OneFuse Scripting Terraform Module
module "script" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//scripting"
    policy = var.policy
    template_properties = var.template_properties
}