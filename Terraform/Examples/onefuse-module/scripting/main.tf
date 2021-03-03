//OneFuse Scripting Terraform Module
module "script" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//scripting"
    policy = "add_ad_user"
    template_properties = var.template_properties
}