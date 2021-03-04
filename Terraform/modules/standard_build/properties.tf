module "environment" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = format("sps_env_%s", var.environment)
  template_properties = var.template_properties
}  

 module "application" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = format("sps_app_%s", var.application)
  template_properties = var.template_properties
} 

 module "location" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = format("sps_location_%s", var.location)
  template_properties = var.template_properties
} 

 module "os" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = module.application.properties.OneFuse_SPS_OS
  template_properties = var.template_properties
} 

 module "group" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = format("sps_group_%s", var.group)
  template_properties = var.template_properties
} 

 module "size" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = format("sps_size_%s", var.size)
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
