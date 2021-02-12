// OneFuse Data Source for DNS Policy to lookup policy ID
data "onefuse_dns_policy" "policy" {
  name = var.policy
}

// OneFuse Resource for DNS Record
resource "onefuse_dns_record" "my-dns-record" {
    
    name = var.hostname
    policy_id = data.onefuse_dns_policy.policy.id
    zones = [var.dns_zones]
    value = var.ip_address
    template_properties = var.template_properties
}