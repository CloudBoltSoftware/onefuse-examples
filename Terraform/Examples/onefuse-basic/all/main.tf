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
  address    = var.onefuse_address
  port       = var.onefuse_port
  user       = var.onefuse_user
  password   = var.onefuse_password
  verify_ssl = var.onefuse_verify_ssl
}

// OneFuse Data Source for IPAM Policy to lookup policy ID
data "onefuse_ipam_policy" "policy" {
  name = "atlprod"
}

// OneFuse Data Source for Naming Policy to lookup policy ID
data "onefuse_naming_policy" "policy" {
  name = "machine"
}

// OneFuse Data Source for AD Policy to lookup policy ID
data "onefuse_ad_policy" "policy" {
  name = "prod"
}

// OneFuse Data Source for DNS Policy to lookup policy ID
data "onefuse_dns_policy" "policy" {
  name = "prod"
}

// OneFuse Resource for Naming Record
resource "onefuse_naming" "name" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  dns_suffix              = ""
  template_properties     = var.template_properties
}

// OneFuse Resource for AD
resource "onefuse_microsoft_ad_computer_account" "computer" {
    
    name = onefuse_naming.name.name
    policy_id = data.onefuse_ad_policy.policy.id
    workspace_url = var.workspace_url
    template_properties = var.template_properties
}

// OneFuse Resource for IPAM Record
resource "onefuse_ipam_record" "ipam-record" {
    
    hostname = onefuse_naming.name.name
    policy_id = data.onefuse_ipam_policy.policy.id
    workspace_url = var.workspace_url
    template_properties = var.template_properties

lifecycle {
    ignore_changes = [
      hostname,
      dns_suffix
    ]
  }
}

// OneFuse Resource for DNS Record
resource "onefuse_dns_record" "dns-record" {
    
    name = onefuse_naming.name.name
    policy_id = data.onefuse_dns_policy.policy.id
    workspace_url = var.workspace_url
    zones = [onefuse_naming.name.dns_suffix]
    value = onefuse_ipam_record.ipam-record.ip_address
    template_properties = var.template_properties
}

// OneFuse Resource for Naming Record
resource "onefuse_naming" "deployment" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  dns_suffix              = ""
  template_properties     = var.template_properties
}

// Output Results for OneFuse resources
output "hostname" {
  value = onefuse_naming.name.name
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

output "fqdn" {
  value = format("%s.%s", onefuse_naming.name.name, onefuse_naming.name.dns_suffix)
}

output "ad_ou" {
  value = onefuse_microsoft_ad_computer_account.computer.final_ou
}

