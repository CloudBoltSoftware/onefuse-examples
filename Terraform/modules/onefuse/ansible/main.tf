// OneFuse Data Source for Ansible Tower Policy to lookup policy ID
data "onefuse_ansible_tower_policy" "policy" {
  name = var.policy
}

// Onefuse Ansible Tower Deployment
resource "onefuse_ansible_tower_deployment" "job" {

  policy_id = data.onefuse_ansible_tower_policy.policy.id
  hosts = [ var.hostname ]
  limit = var.limit
  template_properties = var.template_properties
    timeouts {
      create = "12m"
      delete = "3m"
    }
}

