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

data "onefuse_scripting_policy" "policy" {
  name = "add_ad_user"
}

// Onefuse Scripting Deployment
resource "onefuse_scripting_deployment" "script" {
    policy_id = data.onefuse_scripting_policy.policy.id
    workspace_url = var.workspace_url
    template_properties = {
        "username"        = var.username 
        "firstname"       = var.firstname
        "lastname"        = var.lastname
        "domain"          = var.domain
    }
}

// Output Results for OneFuse resources
output "hostname" {
  value = jsondecode(onefuse_scripting_deployment.script.provisioning_details)
}