data "onefuse_static_property_set" "property_set" {
  name = "sps_f5_sid"
}


locals  {
partition = jsondecode(data.onefuse_static_property_set.property_set.raw).f5_general.partition

node = format("/%s/%s", local.partition, onefuse_naming.machine.name)

}