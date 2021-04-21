//F5 Outputs

output "vip" {
  value = bigip_ltm_virtual_server.vip
}

output "pool" {
  value = bigip_ltm_pool.pool
}

