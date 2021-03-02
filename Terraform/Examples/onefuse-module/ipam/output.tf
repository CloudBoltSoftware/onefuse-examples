//Output OU from module
output "ip_address" {
  value = module.ipam.ip_address
}

output "netmask" {
  value = module.ipam.netmask
}

output "gateway" {
  value = module.ipam.gateway
}

output "network" {
  value = module.ipam.network
}

output "subnet" {
  value = module.ipam.network
}

output "primary_dns" {
  value = module.ipam.primary_dns
}

output "secondary_dns" {
  value = module.ipam.secondary_dns
}