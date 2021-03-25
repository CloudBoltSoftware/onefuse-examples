module "environment" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = "sps_env_prod"
  template_properties = var.template_properties
}  

 module "application" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = "sps_app_wordpress"
  template_properties = var.template_properties
}  

 module "location" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = "sps_location_atl"
  template_properties = var.template_properties
}

 module "os" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = module.application.properties.OneFuse_SPS_OS
  template_properties = var.template_properties
} 

 module "group" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = "sps_group_piedpiper"
  template_properties = var.template_properties
} 

data "onefuse_static_property_set" "size" {
  name = "sps_size_sid"
}

data "onefuse_rendered_template" "size" {
    template = data.onefuse_static_property_set.size.raw
    template_properties = merge(var.template_properties, local.rendered_values)
}

 module "globalproperties" {
  source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ptk?ref=v1.2-beta.1"
  property_set = "sps_globalproperties"
  template_properties = merge(var.template_properties, local.rendered_values)
}

locals  {
  cpu = jsondecode(data.onefuse_rendered_template.size.value).onefuse_platforms.terraform.general.cpu
  memMb = jsondecode(data.onefuse_rendered_template.size.value).onefuse_platforms.terraform.general.memMb
  fqdn = format("%s.%s", module.vm.name, module.onefuse.dns_suffix)
  vSphereFolder = module.globalproperties.properties.folderName
  IPv4_Netmask = module.globalproperties.properties.OneFuse_TF_Props.IPv4_Netmask

rendered_values = {
    cpuCount = jsondecode(data.onefuse_static_property_set.size.raw).onefuse_global.general.cpuCount
    memoryGB = jsondecode(data.onefuse_static_property_set.size.raw).onefuse_global.general.memoryGB
    subnet = module.onefuse.subnet
  }
}
