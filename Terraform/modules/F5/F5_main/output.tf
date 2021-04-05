output "vip_name" {
  value = onefuse_naming.f5.name
}

output "pool_name" {
  value = onefuse_naming.f5.name
}

output "vip_ip_address" {
  value = onefuse_ipam_record.f5.ip_address
}