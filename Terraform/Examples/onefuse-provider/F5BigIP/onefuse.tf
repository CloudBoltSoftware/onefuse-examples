// OneFuse Data Source for IPAM Policy to lookup policy ID
data "onefuse_ipam_policy" "policy" {
  name = var.ipam_policy
}

// OneFuse Data Source for Naming Policy to lookup policy ID
data "onefuse_naming_policy" "policy" {
  name = var.naming_policy
}

// OneFuse Data Source for DNS Policy to lookup policy ID
data "onefuse_dns_policy" "policy" {
  name = var.dns_policy
}

// OneFuse Resource for Naming Record
resource "onefuse_naming" "machine" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  dns_suffix              = ""
  template_properties     = var.template_properties
}

// OneFuse Resource for IPAM Record
resource "onefuse_ipam_record" "ipam-record" {
    
    hostname = onefuse_naming.machine.name
    policy_id = data.onefuse_ipam_policy.policy.id
    template_properties = var.template_properties

lifecycle {
    ignore_changes = [
      hostname,
      dns_suffix
    ]
  }
}

// OneFuse Resource for DNS Record
resource "onefuse_dns_record" "dns-record" {
    
    name = onefuse_naming.machine.name
    policy_id = data.onefuse_dns_policy.policy.id
    zones = [onefuse_naming.machine.dns_suffix]
    value = onefuse_ipam_record.ipam-record.ip_address
    template_properties = var.template_properties
}
