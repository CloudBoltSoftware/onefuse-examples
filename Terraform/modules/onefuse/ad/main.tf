// OneFuse Data Source for AD Policy to lookup policy ID
data "onefuse_ad_policy" "policy" {
  name = var.policy
}

// OneFuse Resource for AD Computer Account
resource "onefuse_microsoft_ad_computer_account" "computer" {
    
    name = var.hostname
    policy_id = data.onefuse_ad_policy.policy.id
    template_properties = var.template_properties
}