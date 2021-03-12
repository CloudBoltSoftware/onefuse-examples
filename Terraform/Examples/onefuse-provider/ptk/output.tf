output "properties" {
  value = jsondecode(data.onefuse_rendered_template.properties.value)
}

output "memory" {
  value = jsondecode(data.onefuse_rendered_template.properties.value).onefuse_platforms.terraform.general.memMb
}