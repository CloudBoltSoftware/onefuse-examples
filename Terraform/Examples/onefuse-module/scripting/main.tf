//OneFuse Scripting Terraform Module
module "script" {
    source = "github.com/CloudBoltSoftware/terraform-module-onefuse.git//scripting"
    policy = var.policy
    template_properties = var.template_properties
}