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

 module "linux" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = module.application.properties.OneFuse_SPS_OS
  template_properties = var.template_properties
} 

 module "group" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_group_piedpiper"
  template_properties = var.template_properties
} 

 module "size" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_size_small"
  template_properties = var.template_properties
}

 module "globalproperties" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_globalproperties"
  template_properties = var.template_properties
}

// Render the template


locals  {
  cpu = module.size.properties.OneFuse_TF_Props.cpu
  memMb = module.size.properties.OneFuse_TF_Props.memMb
  vSphereFolder = module.globalproperties.properties.folderName
  IPv4_Netmask = module.globalproperties.properties.OneFuse_TF_Props.IPv4_Netmask
  hostname = format("%s.%s", module.onefuse.hostname, module.onefuse.dns_suffix)
}