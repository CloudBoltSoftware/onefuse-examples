//Output name from module
output "hostname" {
  value = module.name.hostname
}
output "dns_suffix" {
  value = module.name.dns_suffix
}