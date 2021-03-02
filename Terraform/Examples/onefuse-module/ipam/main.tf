//OneFuse IPAM Terraform Module
module "ipam" {
    source = "github.com/CloudBoltSoftware/terraform-demo.git/modules/onefuse//ipam"
    policy = "prodatl"
    hostname = var.hostname
    template_properties = var.template_properties
}