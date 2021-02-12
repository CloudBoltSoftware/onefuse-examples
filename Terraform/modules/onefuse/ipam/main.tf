data "onefuse_ipam_policy" "policy" {
  name = var.policy
}

resource "onefuse_ipam_record" "ipam-record" {
    
    hostname = var.hostname
    policy_id = data.onefuse_ipam_policy.policy.id
    template_properties = var.template_properties
}