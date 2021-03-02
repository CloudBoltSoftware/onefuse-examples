output "hostname" {
  value = module.name.hostname
}

output "dns_suffix" {
  value = module.name.dns_suffix
}

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

output "fqdn" {
  value = format("%s.%s", module.name.hostname, module.name.dns_suffix)
}

output "ad_ou" {
  value = module.computer.ad_ou
}