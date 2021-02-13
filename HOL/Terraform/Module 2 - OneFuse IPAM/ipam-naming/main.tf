 // Comment out the following for Terraform 0.12

 terraform {
  required_providers {
    onefuse = {
      source  = "CloudBoltSoftware/onefuse"
      version = ">= 1.10.0"
   }
  }
  required_version = ">= 0.13"
}
// Comment out the above for Terraform 0.12

// Inititalize OneFuse Provider
provider "onefuse" {

  scheme     = var.onefuse_scheme
  address    = var.onefusebp_address
  port       = var.onefuse_port
  user       = var.onefuse_user
  password   = var.onefuse_password
  verify_ssl = var.onefuse_verify_ssl
}

// OneFuse Data Source for Naming Policy to lookup policy ID
data "onefuse_naming_policy" "policy" {
  name = "default"
}

// OneFuse Data Source for IPAM Policy to lookup policy ID
data "onefuse_ipam_policy" "policy" {
  name = "prodeast"
}

// OneFuse Resource for Naming
resource "onefuse_naming" "name" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  template_properties     = var.onefuse_template_properties
}

// OneFuse Resource for IPAM Record
resource "onefuse_ipam_record" "ipam-record" {
    
    hostname = onefuse_naming.name.name
    policy_id = data.onefuse_ipam_policy.policy.id
    workspace_url = var.workspace_url
    template_properties = var.onefuse_template_properties
}


// Output Results for Naming
output "hostname" {
  value = onefuse_naming.name.name
}

// Output Results for IPAM Resources
output "ip_address" {
  value = onefuse_ipam_record.ipam-record.ip_address
}

output "netmask" {
  value = onefuse_ipam_record.ipam-record.netmask
}

output "gateway" {
  value = onefuse_ipam_record.ipam-record.gateway
}

output "network" {
  value = onefuse_ipam_record.ipam-record.network
}