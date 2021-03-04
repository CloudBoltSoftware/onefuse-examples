output "hostname" {
  value = module.onefuse.hostname
}

output "dns_suffix" {
  value = module.onefuse.dns_suffix
}

output "ip_address" {
  value = module.onefuse.ip_address
}

output "netmask" {
  value = module.onefuse.netmask
}

output "gateway" {
  value = module.onefuse.gateway
}

output "network" {
  value = module.onefuse.network
}

output "subnet" {
  value = module.onefuse.subnet
}

output "primary_dns" {
  value = module.onefuse.primary_dns
}

output "secondary_dns" {
  value = module.onefuse.secondary_dns
}

output "fqdn" {
  value = format("%s.%s", module.onefuse.hostname, module.onefuse.dns_suffix)
}

output "ad_ou" {
  value = module.onefuse.ad_ou
}