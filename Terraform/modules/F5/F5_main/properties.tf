locals  {
partition = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_general.partition
pool = format("/%s/%s", local.partition, onefuse_naming.f5.name)
virtualserver = format("/%s/%s", local.partition, onefuse_naming.f5.name)

vip_port = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.port
vip_ip_protocol = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.ip_protocol
vip_source_address_translation = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.source_address_translation
vip_name_policy = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.name_policy
vip_ipam_policy = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.ipam_policy
vip_dns_policy = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_vip.dns_policy

monitors = format("/%s/%s", local.partition, jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_pool.monitors)
allow_nat = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_pool.allow_nat
allow_snat = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_pool.allow_snat
load_balancing_mode = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_pool.load_balancing_mode

f5_properties = format("sps_f5_%s", var.f5sps)

}