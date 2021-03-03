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

// OneFuse Data Source for Ansible Tower Policy to lookup policy ID
data "onefuse_ansible_tower_policy" "policy" {
  name = "linux_build"
}

// Onefuse Ansible Tower Deployment
resource "onefuse_ansible_tower_deployment" "at_job" {

  policy_id = data.onefuse_ansible_tower_policy.policy.id
  hosts = [ local.hostname ] 
  template_properties = var.template_properties
    timeouts {
      create = "12m"
      delete = "3m"
    }
}

locals {
    hostname = "pp-atlplap054.infoblox851.sovlabs.net"
}
