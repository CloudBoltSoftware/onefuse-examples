module "properties" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = var.property_set
  template_properties = var.template_properties
}