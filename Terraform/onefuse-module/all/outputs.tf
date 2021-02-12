//Output name from Naming module
output "hostname" {
  value = module.name.hostname
}

//Output IP address from IPAM module
output "ip_address" {
  value = module.ipam.ip_address
}

//Output netmask from IPAM module
output "netmask" {
  value = module.ipam.netmask
}

//Output gateway from IPAM module
output "gateway" {
  value = module.ipam.gateway
}

//Output fqdn from naming module
output "fqdn" {
  value = format("%s.%s", module.name.hostname, module.name.dns_suffix)
}

//Output OU from AD module
output "ad_ou" {
  value = module.computer.ad_ou
}