module "vm" {
  source = "../../../modules/simplevm"
  environment = var.environment
  application = var.application
  location = var.location
  group = var.group
}