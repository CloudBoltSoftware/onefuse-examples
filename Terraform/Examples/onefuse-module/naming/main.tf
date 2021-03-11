//OneFuse Naming Terraform Module
module "name" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//naming?ref=v1.2-beta.1"
    policy = var.policy
    template_properties = var.template_properties
}