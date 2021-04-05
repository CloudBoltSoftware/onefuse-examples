data "onefuse_static_property_set" "property_set" {
  name = local.f5_properties
}

locals  {
partition = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_general.partition
f5_name_policy = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_vip.name_policy
f5_ipam_policy = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_vip.ipam_policy
f5_dns_policy = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_vip.dns_policy

f5_properties = format("sps_f5_%s", var.property_set)
}
