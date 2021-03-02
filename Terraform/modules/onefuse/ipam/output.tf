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