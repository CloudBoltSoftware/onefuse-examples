data "onefuse_static_property_set" "property_set" {
  name = "sps_f5_sid"
}


locals  {
partition = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_general.partition

node = format("/%s/%s", local.partition, onefuse_naming.machine.name)
monitors = format("/%s/%s", local.partition, jsondecode(data.onefuse_static_property_set.property_set.raw).f5_pool.monitors)
allow_nat = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_pool.allow_nat
allow_snat = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_pool.allow_snat
load_balancing_mode = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_pool.load_balancing_mode

node_connection_limit = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_node.connection_limit
node_rate_limit = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_node.rate_limit
node_port = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_node.port
node_address_family = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_node.address_family
node_ratio = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_node.ratio

}