module "environment" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_env_prod"
  template_properties = var.template_properties
}  

 module "application" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_app_wordpress"
  template_properties = var.template_properties
}  

 module "location" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_location_atl"
  template_properties = var.template_properties
}

 module "os" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = module.application.properties.OneFuse_SPS_OS
  template_properties = var.template_properties
} 

 module "group" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_group_piedpiper"
  template_properties = var.template_properties
} 

data "onefuse_static_property_set" "size" {
  name = "sps_size_small"
}
 module "rendered_size" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_size_small"
  template_properties = merge(var.template_properties, local.rendered_values)
}

 module "globalproperties" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
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
    cpuCount = data.onefuse_static_property_set.size.properties.cpuCount
    memoryGB = data.onefuse_static_property_set.size.properties.memoryGB
    subnet = module.onefuse.subnet
  }
}
