module "properties" {
  source = "github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk"
  property_set = var.property_set
  template_properties = var.template_properties
}