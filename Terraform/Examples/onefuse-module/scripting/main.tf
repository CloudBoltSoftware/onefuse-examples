//OneFuse Scripting Terraform Module
module "script" {
    source = "github.com/CloudBoltSoftware/terraform-demo.git/modules/onefuse//scripting"
    policy = "add_ad_user"
    template_properties = var.template_properties
}