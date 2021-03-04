data "onefuse_static_property_set" "size" {
  name = "sps_size_medium"
}
locals  {

rendered_values = {
    cpuCount = data.onefuse_static_property_set.size.properties.cpuCount
    memoryGB = data.onefuse_static_property_set.size.properties.memoryGB
  }
}

output "cpucount" {
value = local.rendered_values.cpuCount
}

output "memoryGB" {
 value = local.rendered_values.memoryGB
}
