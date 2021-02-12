//OneFuse Naming Terraform Module
module "name" {
    source = "../../../modules/onefuse/naming"
    policy = "machine"
    template_properties = var.template_properties
}