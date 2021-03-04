//Lookup environment property set
  data "onefuse_static_property_set" "environment" {
  name = "sps_env_prod"
}
//Lookup application property set
data "onefuse_static_property_set" "application" {
  name = "sps_app_wordpress"
}

data "onefuse_static_property_set" "linux" {
  name = "linux"
}

data "onefuse_static_property_set" "group" {
    name = "sps_group_piedpiper"
}

data "onefuse_static_property_set" "size" {
    name = "sps_size_small"
}

data "onefuse_static_property_set" "globalproperties" {
    name = "sps_globalproperties"
}

// Render the template
data "onefuse_rendered_template" "global_rendered" {
    template = data.onefuse_static_property_set.globalproperties.raw
    template_properties = {
      "folderGroup"      = data.onefuse_static_property_set.group.properties.folderGroup
      "folderEnv"        = data.onefuse_static_property_set.environment.properties.folderEnv
      "subnet"           = onefuse_ipam_record.ipam-record.subnet
    }
}

locals  {
  cpu = "1"
  memMb = "2048"
  vSphereFolder = jsondecode(data.onefuse_rendered_template.global_rendered.value).folderName
  IPv4_Netmask = jsondecode(data.onefuse_rendered_template.global_rendered.value).OneFuse_TF_Props.IPv4_Netmask
  hostname = format("%s.%s", onefuse_naming.name.name, onefuse_naming.name.dns_suffix)
}

output "cpu" {
  value = local.cpu
}

output "mem" {
  value = local.mem
}

output "vSphere_folder" {
  value = local.vSphereFolder
}

output "IPv4_Netmask" {
  value = local.IPv4_Netmask
}