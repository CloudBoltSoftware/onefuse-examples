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

data "onefuse_ad_policy" "policy" {
  name = var.policy
}

resource "onefuse_microsoft_ad_computer_account" "computer" {
    
    name = var.hostname
    policy_id = data.onefuse_ad_policy.policy.id
    template_properties = var.template_properties
}

output "ad_ou" {
  value = onefuse_microsoft_ad_computer_account.computer.final_ou
}