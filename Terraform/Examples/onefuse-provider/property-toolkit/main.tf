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