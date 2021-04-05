data "onefuse_static_property_set" "f5_properties" {
  name = local.f5_properties
}

locals  {
partition = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_general.partition
pool = format("/%s/%s", local.partition, var.name)


monitors = format("/%s/%s", local.partition, jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_pool.monitors)
allow_nat = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_pool.allow_nat
allow_snat = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_pool.allow_snat
load_balancing_mode = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_pool.load_balancing_mode

f5_properties = format("sps_f5_%s", var.property_set)

}