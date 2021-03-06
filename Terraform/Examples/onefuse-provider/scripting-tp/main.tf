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
  name = "Test"
}

// Onefuse Scripting Deployment
resource "onefuse_scripting_deployment" "script" {
    policy_id = data.onefuse_scripting_policy.policy.id
    template_properties = var.template_properties
}

// Output Results for OneFuse resources
output "script_output" {
  value = jsondecode(onefuse_scripting_deployment.script.provisioning_details)
}