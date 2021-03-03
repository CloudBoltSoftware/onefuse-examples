//OneFuse Scripting Terraform Module
module "script" {
    source = "https://github.com/CloudBoltSoftware/onefuse-examples.git/modules/onefuse//scripting"
    policy = "add_ad_user"
    template_properties = var.template_properties
}