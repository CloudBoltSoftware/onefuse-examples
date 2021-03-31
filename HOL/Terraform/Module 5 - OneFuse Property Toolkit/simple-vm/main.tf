module "vm" {
  source = "../property-toolkit"
  environment              = var.environment
  application              = var.application
  size                     = var.size
  location                 = var.location
  compliance               = var.compliance
}

/*
module "vm2" {
  source = "../property-toolkit"
  environment              = var.environment
  application              = var.application
  size                     = var.size
  location                 = var.location
  compliance               = var.compliance
}
*/