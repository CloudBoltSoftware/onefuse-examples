// OneFuse Data Source for Naming Policy to lookup policy ID
data "onefuse_naming_policy" "f5_policy" {
  name = local.vip_name_policy
}

// OneFuse Data Source for IPAM Policy to lookup policy ID
data "onefuse_ipam_policy" "f5_policy" {
  name = local.vip_ipam_policy
}

// OneFuse Data Source for DNS Policy to lookup policy ID
data "onefuse_dns_policy" "f5_policy" {
  name = local.vip_dns_policy
}

data "onefuse_static_property_set" "f5_properties" {
  name = local.f5_properties
}

resource "onefuse_naming" "f5" {
  naming_policy_id        = data.onefuse_naming_policy.f5_policy.id
  dns_suffix              = ""
  template_properties     = var.template_properties
}

// OneFuse Resource for IPAM Record
resource "onefuse_ipam_record" "f5_ipam" {
    
    hostname = onefuse_naming.f5.name
    policy_id = data.onefuse_ipam_policy.f5_policy.id
    template_properties = var.template_properties

lifecycle {
    ignore_changes = [
      hostname,
      dns_suffix
    ]
  }
}

// OneFuse Resource for DNS Record
resource "onefuse_dns_record" "f5_dns_record" {
    
    name = onefuse_naming.f5.name
    policy_id = data.onefuse_dns_policy.f5_policy.id
    zones = [onefuse_naming.f5.dns_suffix]
    value = onefuse_ipam_record.f5_ipam.ip_address
    template_properties = var.template_properties
}