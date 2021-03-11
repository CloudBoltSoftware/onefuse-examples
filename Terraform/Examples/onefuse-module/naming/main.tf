//OneFuse Naming Terraform Module
module "name" {
    source = "github.com/CloudBoltSoftware/terraform-module-onefuse.git//naming"
    policy = var.policy
    template_properties = var.template_properties
}