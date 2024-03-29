 terraform {
  required_providers {
    onefuse = {
      source  = "CloudBoltSoftware/onefuse"
      version = ">= 1.20.0"
   }
  }
  required_version = ">= 0.13"
}
provider "onefuse" {
  scheme     = var.onefuse_scheme
  address    = var.onefuse_address
  port       = var.onefuse_port
  user       = var.onefuse_user
  password   = var.onefuse_password
  verify_ssl = var.onefuse_verify_ssl
}
data "onefuse_naming_policy" "policy" {
  name = var.policy
}
resource "onefuse_naming" "machine" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  template_properties     = var.template_properties
}
output "hostname" {
  value = onefuse_naming.machine.name
}
