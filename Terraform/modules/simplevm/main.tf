  //Lookup environment property set
data "onefuse_static_property_set" "environment" {
name = format("sps_env_%s", var.environment)
}
//Lookup application property set
data "onefuse_static_property_set" "application" {
  name = format("sps_app_%s", var.application)
}

//Lookup location property set
data "onefuse_static_property_set" "location" {
  name = format("sps_location_%s", var.location)
}

//Lookup group property set
data "onefuse_static_property_set" "group" {
  name = format("sps_group_%s", var.group)
}

//Consolidated onefuse terraform module
module "onefuse" {
    source = "../onefuse"
    name_policy = var.name_policy
    ad_policy = data.onefuse_static_property_set.environment.properties.adPolicy
    ipam_policy = format("%s%s", data.onefuse_static_property_set.environment.properties.location, var.environment)
    dns_policy = data.onefuse_static_property_set.environment.properties.dnsPolicy
    template_properties = {
      "nameEnv"               = data.onefuse_static_property_set.environment.properties.nameEnv
      "nameOS"         	      = data.onefuse_static_property_set.application.properties.nameOS
      "nameGroup"             = data.onefuse_static_property_set.group.properties.nameGroup
      "nameApp"               = data.onefuse_static_property_set.application.properties.nameApp
      "nameLocation"          = data.onefuse_static_property_set.environment.properties.location
      "ouGroup"               = data.onefuse_static_property_set.group.properties.ouGroup
      "ouEnv"                 = data.onefuse_static_property_set.environment.properties.ouEnv
      "dnsSuffix"             = data.onefuse_static_property_set.environment.properties.dnsSuffix
      "sgEnv"                 = data.onefuse_static_property_set.environment.properties.sgEnv
  }
}

module "vm" {
  source = "../vsphere/vm"
  hostname = module.onefuse.hostname
  template = data.onefuse_static_property_set.application.properties.template
  ip_address = module.onefuse.ip_address
  network = module.onefuse.network
  gateway = module.onefuse.gateway
  dns_suffix = module.onefuse.dns_suffix
  folder = var.folder
}