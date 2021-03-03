//OneFuse Naming Terraform Module
module "name" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//namning"
    policy = var.policy
    template_properties = var.template_properties
}