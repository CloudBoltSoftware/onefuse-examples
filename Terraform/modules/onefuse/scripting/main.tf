data "onefuse_scripting_policy" "policy" {
  name = "add_ad_user"
}

// Onefuse Scripting Deployment
resource "onefuse_scripting_deployment" "script" {
    policy_id = data.onefuse_scripting_policy.policy.id
    template_properties = var.template_properties
}

