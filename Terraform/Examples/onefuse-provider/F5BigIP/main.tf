 terraform {
  required_providers {
    onefuse = {
      source  = "CloudBoltSoftware/onefuse"
      version = ">= 1.20.0"
   }
   bigip = {
      source = "F5Networks/bigip"
      version = "1.8.0"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address = var.f5_hostname
  username = var.f5_username
  password = var.f5_password
}

// Inititalize OneFuse Provider
provider "onefuse" {

  scheme     = var.onefuse_scheme
  address    = var.onefuse_address
  port       = var.onefuse_port
  user       = var.onefuse_user
  password   = var.onefuse_password
  verify_ssl = var.onefuse_verify_ssl
}

data "onefuse_static_property_set" "property_set" {
  name = "sps_f5_sid"
}

locals  {
partition = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_general.partition
}

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
    f5sps = var.f5sps
    name = format("/%s/%s", local.partition, module.vm.hostname)
    description  = "Test Module Deploy"
    address = module.vm.ip_address
    pool = module.f5vip.pool_name
}