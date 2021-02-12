output "hostname" {
  value = onefuse_naming.machine-name.name
}

output "dns_suffix" {
  value = onefuse_naming.machine-name.dns_suffix
}