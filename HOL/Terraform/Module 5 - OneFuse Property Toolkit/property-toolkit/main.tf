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
  name = "machineNaming"
}

// OneFuse Data Source for IPAM Policy to lookup policy ID
data "onefuse_ipam_policy" "policy" {
  name = format("%s%s", var.environment, var.location)
}

// OneFuse Data Source for DNS Policy to lookup policy ID
data "onefuse_dns_policy" "policy" {
  name = "default"
}

// OneFuse Data Source for AD Policy to lookup policy ID
data "onefuse_ad_policy" "policy" {
  name = "default"
}

// OneFuse Resource for Naming
resource "onefuse_naming" "name" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  template_properties     = local.onefuse_template_properties
}

// OneFuse Resource for IPAM Record
resource "onefuse_ipam_record" "ipam-record" {
    
    hostname = onefuse_naming.name.name
    policy_id = data.onefuse_ipam_policy.policy.id
    workspace_url = var.workspace_url
    template_properties = local.onefuse_template_properties
}

// OneFuse Resource for DNS Record
resource "onefuse_dns_record" "dns-record" {
    
    name = onefuse_naming.name.name
    policy_id = data.onefuse_dns_policy.policy.id
    workspace_url = var.workspace_url
    zones = [onefuse_naming.name.dns_suffix]
    value = onefuse_ipam_record.ipam-record.ip_address
    template_properties = local.onefuse_template_properties
}

// OneFuse Resource for AD
resource "onefuse_microsoft_ad_computer_account" "computer" {
    
    name = onefuse_naming.name.name
    policy_id = data.onefuse_ad_policy.policy.id
    workspace_url = var.workspace_url
    template_properties = local.onefuse_template_properties
}

