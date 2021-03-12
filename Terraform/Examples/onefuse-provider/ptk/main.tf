data "onefuse_static_property_set" "property_set" {
  name = var.property_set
}


data "onefuse_rendered_template" "properties" {
    template = data.onefuse_static_property_set.property_set.raw
    template_properties = var.template_properties
}