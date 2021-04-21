module "f5vip" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/F5/F5_main"
    f5sps = var.f5sps
    template_properties = var.template_properties
}

module "vm" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/standard_build"
  template_properties      = var.template_properties
  name_policy              = var.name_policy
  environment              = var.environment
  application              = var.application
  group                    = var.group
  size                     = var.size
  location                 = var.location
}

module "f5node" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/F5/Node"
    property_set = var.f5sps
    name = format("/%s/%s", local.partition, module.vm.hostname)
    description  = "Test Module Deploy"
    address =  module.vm.ip_address
    pool = module.f5vip.pool_name
}

/**
module "script" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//scripting?ref=v1.2-beta.1"
    policy = "Test"
    template_properties = var.template_properties
}
**/