//OneFuse Naming Terraform Module
module "name" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//naming"
    policy = "machine"
    template_properties = var.template_properties
}