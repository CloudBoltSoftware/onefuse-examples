module "vm" {
  source = "./vm"
  hostname = var.hostname
  template = var.template
  ip_address = var.ip_address
  network = var.network
  gateway = var.gateway
  dns_suffix = var.dns_suffix
  folder = var.folder
}