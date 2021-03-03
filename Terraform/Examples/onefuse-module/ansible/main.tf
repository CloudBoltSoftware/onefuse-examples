//OneFuse Naming Terraform Module
module "ansible_job" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ansible"
    policy = var.policy
    hostname = var.hostname
    template_properties = var.template_properties
}