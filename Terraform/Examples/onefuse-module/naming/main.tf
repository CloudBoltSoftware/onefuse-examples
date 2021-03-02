//OneFuse Naming Terraform Module
module "name" {
    source = "github.com/CloudBoltSoftware/terraform-demo.git/modules/onefuse//naming"
    policy = "machine"
    template_properties = var.template_properties
}