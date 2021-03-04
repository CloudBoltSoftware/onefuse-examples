module "size" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_size_small"
  template_properties = var.template_properties
}



locals  {

rendered_values = {
    cpuCount = module.size.properties.cpuCount
    memoryGB = module.size.properties.memoryGB
  }
}

output "cpucount" {
value = local.rendered_values.cpuCount
}

output "memoryGB" {
 value = local.rendered_values.memoryGB
}
