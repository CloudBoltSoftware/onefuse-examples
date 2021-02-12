//Output name from Naming module
output "hostname" {
  value = module.onefuse.hostname
}

//Output IP address from IPAM module
output "ip_address" {
  value = module.onefuse.ip_address
}

//Output netmask address from IPAM module
output "netmask" {
  value = module.onefuse.netmask
}

//Output gateway from IPAM module
output "gateway" {
  value = module.onefuse.gateway
}

//Output fqdn from IPAM module
output "fqdn" {
  value = module.onefuse.fqdn
}

//Output ad_ou from IPAM module
output "ad_ou" {
  value = module.onefuse.ad_ou
}