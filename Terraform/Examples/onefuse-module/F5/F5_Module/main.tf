module "f5_name" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//naming?ref=v1.2-beta.1"
    policy = format("sps_f5_%s", local.f5_name_policy)
    template_properties = var.template_properties
}

module "f5_ipam" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ipam?ref=v1.2-beta.1"
    policy = format("sps_f5_%s", local.f5_ipam_policy)
    hostname = module.f5_name.hostname
    template_properties = var.template_properties
}

module "f5_dns" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//dns?ref=v1.2-beta.1"
    policy = format("sps_f5_%s", local.f5_dns_policy)
    hostname = module.f5_name.hostname
    ip_address = odule.f5_ipam.ip_address
    dns_zones = var.dns_zones
    template_properties = var.template_properties
}

module "f5_vip" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/F5/F5_vip"
    name = module.f5_name.hostname
    pool_name = module.f5_name.hostname
    destination_address = module.f5_ipam.ip_address
    property_set = var.property_set
}

module "f5_pool" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/F5/F5_pool"
    name = module.f5_name.hostname
    virtual_server = module.f5_name.hostname
    property_set = var.property_set
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

module "f5_node" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/F5/Node"
    property_set = var.property_set
    name = format("/%s/%s", local.partition, module.vm.hostname)
    description  = "Test Module Deploy"
    address = module.vm.ip_address
    pool = module.f5_pool.pool_name
}