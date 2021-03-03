//OneFuse Naming Terraform Module
module "name" {
    source = "https://github.com/CloudBoltSoftware/onefuse-examples.git/modules/onefuse//naming"
    policy = "machine"
    template_properties = var.template_properties
}