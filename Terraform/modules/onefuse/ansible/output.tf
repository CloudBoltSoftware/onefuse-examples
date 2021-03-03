output "ansible_output" {
  value = jsondecode(onefuse_ansible_tower_deployment.job.provisioning_job_results)
}

output "ansible_hosts" {
  value = onefuse_ansible_tower_deployment.job.hosts
}

output "ansible_inventory" {
  value = onefuse_ansible_tower_deployment.job.inventory_name
}