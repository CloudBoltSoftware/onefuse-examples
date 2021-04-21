data "onefuse_static_property_set" "property_set" {
  name = local.f5_properties
}

locals  {
partition = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_general.partition
f5_properties = format("sps_f5_%s", var.f5sps)
}
