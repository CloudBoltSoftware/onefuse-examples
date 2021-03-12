 // Comment out the following for Terraform 0.12

 terraform {
  required_providers {
    onefuse = {
      source  = "CloudBoltSoftware/onefuse"
      version = ">= 1.20.0"
   }
  }
  required_version = ">= 0.13"
}
// Comment out the above for Terraform 0.12

// Inititalize OneFuse Provider
provider "onefuse" {

  scheme     = var.onefuse_scheme
  address    = var.onefuse_address
  port       = var.onefuse_port
  user       = var.onefuse_user
  password   = var.onefuse_password
  verify_ssl = var.onefuse_verify_ssl
}

// OneFuse Data Source for Naming Policy to lookup policy ID
data "onefuse_naming_policy" "policy" {
  name = var.policy
}

// OneFuse Resource for Naming
resource "onefuse_naming" "machine" {
  count = 1
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  template_properties     = var.template_properties
}

// Output Results for Naming
output "hostname" {
  value = ["${onefuse_naming.machine.*.name}"]
}