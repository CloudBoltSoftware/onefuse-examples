module "environment" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = format("sps_env_%s", var.environment)
  template_properties = var.template_properties
}  

 module "application" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = format("sps_app_%s", var.application)
  template_properties = var.template_properties
}  

 module "location" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = format("sps_loc_%s", var.location)
  template_properties = var.template_properties
}

 module "os" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = module.application.properties.OneFuse_SPS_OS
  template_properties = var.template_properties
} 

 module "group" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = format("sps_group_%s", var.group)
  template_properties = var.template_properties
} 

data "onefuse_static_property_set" "size" {
  name = format("sps_size_%s", var.size)
}
 module "rendered_size" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = format("sps_size_%s", var.size)
  template_properties = merge(var.template_properties, local.rendered_values)
}

 module "globalproperties" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = "sps_globalproperties"
  template_properties = merge(var.template_properties, local.rendered_values)
}

locals  {
  cpu = module.rendered_size.properties.OneFuse_TF_Props.cpu
  memMb = module.rendered_size.properties.OneFuse_TF_Props.memMb
  fqdn = format("%s.%s", module.onefuse.hostname, module.onefuse.dns_suffix)
  vSphereFolder = module.globalproperties.properties.folderName
  IPv4_Netmask = module.globalproperties.properties.OneFuse_TF_Props.IPv4_Netmask

rendered_values = {
    cpuCount = jsondecode(data.onefuse_static_property_set.size.raw).Global_Props.cpuCount
    memoryGB = jsondecode(data.onefuse_static_property_set.size.raw).Global_Props.memoryGB
    subnet = module.onefuse.subnet
  }
}