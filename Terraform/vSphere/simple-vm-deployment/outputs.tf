//Output name from Naming module
output "hostname" {
  value = module.vm.hostname
}

//Output IP address from IPAM module
output "network" {
  value = module.vm.network
}

//Output IP address from IPAM module
output "ip_address" {
  value = module.vm.ip_address
}

//Output netmask address from IPAM module
output "netmask" {
  value = module.vm.netmask
}

//Output gateway from IPAM module
output "gateway" {
  value = module.vm.gateway
}

//Output fqdn from IPAM module
output "fqdn" {
  value = module.vm.fqdn
}

//Output ad_ou from IPAM module
output "ad_ou" {
  value = module.vm.ad_ou
}