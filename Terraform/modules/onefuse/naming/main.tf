data "onefuse_naming_policy" "machine" {
  name = var.policy
}

resource "onefuse_naming" "machine-name" {
  naming_policy_id        = data.onefuse_naming_policy.machine.id
  template_properties     = var.template_properties
}