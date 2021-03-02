output "properties" {
  value = jsondecode(data.onefuse_rendered_template.properties.value)
}
