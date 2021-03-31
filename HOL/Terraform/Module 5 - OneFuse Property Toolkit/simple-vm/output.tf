output "hostname" {
  value = onefuse_naming.name.id
}

// Output Results for IPAM Resources
output "ip_address" {
  value = onefuse_ipam_record.ipam-record.ip_address
}

output "netmask" {
  value = onefuse_ipam_record.ipam-record.netmask
}

output "gateway" {
  value = onefuse_ipam_record.ipam-record.gateway
}

output "network" {
  value = onefuse_ipam_record.ipam-record.network
}

output "subnet" {
  value = onefuse_ipam_record.ipam-record.subnet
}

output "primary_dns" {
  value = onefuse_ipam_record.ipam-record.primary_dns
}

output "secondary_dns" {
  value = onefuse_ipam_record.ipam-record.secondary_dns
}

output "dns_suffix" {
  value = onefuse_ipam_record.ipam-record.dns_suffix
}

output "vSphere_Folder" {
  value = vsphere_virtual_machine.vm.folder
}

output "ad_ou" {
  value = onefuse_microsoft_ad_computer_account.computer.final_ou
}