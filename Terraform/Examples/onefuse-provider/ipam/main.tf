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

data "onefuse_ipam_policy" "policy" {
  name = var.policy
}

resource "onefuse_ipam_record" "ipam-record" {
    
    hostname = var.hostname
    policy_id = data.onefuse_ipam_policy.policy.id
    template_properties = var.template_properties
}

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

output "subnet" {
  value = onefuse_ipam_record.ipam-record.subnet
}

output "primary_dns" {
  value = onefuse_ipam_record.ipam-record.primary_dns
}

output "secondary_dns" {
  value = onefuse_ipam_record.ipam-record.secondary_dns
}