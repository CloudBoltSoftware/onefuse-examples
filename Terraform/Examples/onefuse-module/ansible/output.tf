//Output name from module
output "ansible_output" {
  value = module.ansible_job.ansible_output
}

output "ansible_hosts" {
  value = module.ansible_job.ansible_hosts
}

output "ansible_inventory" {
  value = module.ansible_job.ansible_inventory
}