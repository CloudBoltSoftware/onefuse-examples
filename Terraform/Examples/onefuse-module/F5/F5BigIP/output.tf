output "hostname" {
  value = module.vm.hostname
}

output "dns_suffix" {
  value = module.vm.dns_suffix
}

output "ip_address" {
  value = module.vm.ip_address
}

output "netmask" {
  value = module.vm.netmask
}

output "gateway" {
  value = module.vm.gateway
}

output "network" {
  value = module.vm.network
}

output "subnet" {
  value = module.vm.subnet
}

output "primary_dns" {
  value = module.vm.primary_dns
}

output "secondary_dns" {
  value = module.vm.secondary_dns
}

output "fqdn" {
  value = format("%s.%s", module.vm.hostname, module.vm.dns_suffix)
}

output "ad_ou" {
  value = module.vm.ad_ou
}

output "cpu" {
  value = module.vm.cpu
}

output "mem" {
  value = module.vm.mem
}

output "vSphere_folder" {
  value = module.vm.vSphere_folder
}

output "IPv4_Netmask" {
  value = module.vm.IPv4_Netmask
}