data "onefuse_static_property_set" "f5_properties" {
  name = local.f5_properties
}

locals  {
partition = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_general.partition
pool = format("/%s/%s", local.partition, var.pool_name)
virtualserver = format("/%s/%s", local.partition, var.name)

vip_port = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.port
vip_ip_protocol = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.ip_protocol
vip_source_address_translation = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.source_address_translation

f5_properties = format("sps_f5_%s", var.property_set)

}