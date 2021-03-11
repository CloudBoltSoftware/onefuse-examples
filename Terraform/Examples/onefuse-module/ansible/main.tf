//OneFuse Naming Terraform Module
module "ansible_job" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ansible"
    policy = var.policy
    hostname = var.hostname
    template_properties = var.template_properties
}