//Lookup environment property set
  data "onefuse_static_property_set" "environment" {
  name = format("sps_env_%s", var.environment)
}

//Lookup group property set
  data "onefuse_static_property_set" "group" {
  name = format("sps_group_%s", var.group)
}

module "deployment" {
    source = "../../../modules/onefuse/naming"
    policy = "deployment"
    template_properties = {
      deployNameRequestSource = "tf"
      deployNameEnv = var.environment
      deployNameApp = var.application
    }
}

module "vsphereFolder" {
    source = "../../../modules/vsphere/folder"
    path =  format("VRM-BACKUPEXCLUDED/demo/%s/%s/%s", data.onefuse_static_property_set.group.properties.folderGroup, data.onefuse_static_property_set.environment.properties.folderEnv, module.deployment.hostname)
}

module "web" {
  source = "../../../modules/simplevm"
  environment = var.environment
  application = var.application
  location = var.location
  group = var.group
  folder = module.vsphereFolder.path
}

module "app" {
  source = "../../../modules/simplevm"
  environment = var.environment
  application = var.application
  location = var.location
  group = var.group
  folder = module.vsphereFolder.path
}

module "db" {
  source = "../../../modules/simplevm"
  environment = var.environment
  application = var.application
  location = var.location
  group = var.group
  folder = module.vsphereFolder.path
}