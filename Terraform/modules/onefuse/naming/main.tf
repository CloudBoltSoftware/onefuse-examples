data "onefuse_naming_policy" "policy" {
  name = var.policy
}

resource "onefuse_naming" "name" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  template_properties     = var.template_properties
}