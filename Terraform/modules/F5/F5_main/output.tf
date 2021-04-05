output "vip_name" {
  value = local.virtualserver
}

output "pool_name" {
  value = local.pool
}

output "vip_ip_address" {
  value = onefuse_ipam_record.f5.ip_address
}