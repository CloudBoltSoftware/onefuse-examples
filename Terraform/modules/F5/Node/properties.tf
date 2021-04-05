data "onefuse_static_property_set" "f5_properties" {
  name = local.f5_properties
}

locals  {
partition = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_general.partition

node_connection_limit = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_node.connection_limit
node_rate_limit = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_node.rate_limit
node_port = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_node.port
node_address_family = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_node.address_family
node_ratio = jsondecode(data.onefuse_static_property_set.f5_properties.raw).f5_node.ratio

f5_properties = format("sps_f5_%s", var.property_set)

}