data "onefuse_static_property_set" "properties" {
  for_each = local.rendered_property_sets
  name = each.value
}

locals {
  rendered_property_sets = {for key, value in var.property_sets : key => format("%s_%s", key, value)}
}