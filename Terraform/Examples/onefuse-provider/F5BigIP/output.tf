// Output Results for OneFuse resources
output "hostname" {
  value = onefuse_naming.machine.name
}

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

output "machine_fqdn" {
  value = onefuse_naming.machine.id
}

output "F5_VIP_IP" {
    value = onefuse_ipam_record.f5_ipam.ip_address
}

output "F5_FQDN" {
    value = onefuse_naming.f5.id
}

output "F5_POOL_NAME" {
    value = onefuse_naming.f5.name
}