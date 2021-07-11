terraform {
  required_providers {
    onefuse = {
      source  = "cloudboltsoftware/onefuse"
      version = ">= 1.30.0"
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



data "onefuse_vra_policy" "policy" {
  name = var.policy
}

resource "onefuse_vra_deployment" "machine" {
  policy_id            = data.onefuse_vra_policy.policy.id
  template_properties  = var.template_properties
  deployment_name      = "sidtest5"

}

data "onefuse_static_property_set" "property_set" {
  name = var.property_set
}


data "onefuse_rendered_template" "properties" {
    template = data.onefuse_static_property_set.property_set.raw
    template_properties = var.template_properties
}

output "properties" {
  value = jsondecode(data.onefuse_rendered_template.properties.value)
}

output "policy_id" {
  value = jsondecode(onefuse_vra_deployment.machine.policy_id)
}

output "vRA_Output" {
  value = jsondecode(onefuse_vra_deployment.machine.deployment_info)
}
