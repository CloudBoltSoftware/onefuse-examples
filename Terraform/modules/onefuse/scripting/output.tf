// Output Results for OneFuse resources
output "script_output" {
  value = jsondecode(onefuse_scripting_deployment.script.provisioning_details)
}