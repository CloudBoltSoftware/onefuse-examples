//OneFuse Naming Terraform Module
module "ansible_job" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ansible?ref=v1.2-beta.1"
    policy = var.policy
    hostname = var.hostname
    template_properties = var.template_properties
}