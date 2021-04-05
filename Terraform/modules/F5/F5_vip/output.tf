//F5 Outputs

output "vip_name" {
  value = local.virtualserver
}

output "vip_ip_address" {
  value = var.destination_address
}
