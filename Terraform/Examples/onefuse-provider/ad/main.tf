 // Comment out the following for Terraform 0.12 to work

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

// OneFuse Data Source for AD Policy to lookup policy ID
data "onefuse_ad_policy" "policy" {
  name = var.policy
}

// OneFuse Resource for AD Computer Account
resource "onefuse_microsoft_ad_computer_account" "computer" {
    
    name = var.name
    policy_id = data.onefuse_ad_policy.policy.id
    workspace_url = var.workspace_url
    template_properties = var.template_properties
}

// Output Result for AD OU Placement
output "ad_ou" {
  value = onefuse_microsoft_ad_computer_account.computer.final_ou
}