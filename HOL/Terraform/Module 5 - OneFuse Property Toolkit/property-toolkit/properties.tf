data "onefuse_static_property_set" "env" {
  name = format("sps_env_%s", var.environment)
}

data "onefuse_static_property_set" "loc" {
  name = format("sps_loc_%s", var.location)
}

data "onefuse_static_property_set" "app" {
  name = format("sps_app_%s", var.application)
}

data "onefuse_static_property_set" "size" {
  name = format("sps_size_%s", var.size)
}

data "onefuse_static_property_set" "comp" {
  name = format("sps_comp_%s", var.compliance)
}

locals {

    onefuse_template_properties = {
      nameEnvironment               = jsondecode(data.onefuse_static_property_set.env.raw).onefuse_global.general.nameEnvironment
      nameLocation                  = jsondecode(data.onefuse_static_property_set.loc.raw).onefuse_global.general.nameLocation
      nameApplication               = jsondecode(data.onefuse_static_property_set.app.raw).onefuse_global.general.nameApplication
      nameOS         	            = jsondecode(data.onefuse_static_property_set.app.raw).onefuse_global.general.nameOS
      nameCompliance                = jsondecode(data.onefuse_static_property_set.comp.raw).onefuse_global.general.nameCompliance
      dnsZone                       = jsondecode(data.onefuse_static_property_set.env.raw).onefuse_global.general.dnsZone
      ouEnvironment                 = jsondecode(data.onefuse_static_property_set.env.raw).onefuse_global.general.ouEnvironment
      vCenterFolder                 = jsondecode(data.onefuse_static_property_set.env.raw).onefuse_global.general.vCenterFolder
    }
    cpuCount                        = jsondecode(data.onefuse_static_property_set.size.raw).onefuse_platforms.terraform.general.cpu
    memSize                         = jsondecode(data.onefuse_static_property_set.size.raw).onefuse_platforms.terraform.general.memMb
    template                        = jsondecode(data.onefuse_static_property_set.app.raw).onefuse_platforms.terraform.general.template
}
