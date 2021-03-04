module "onefuse" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse"
    name_policy         = var.name_policy
    ipam_policy         = var.ipam_policy
    dns_policy          = var.dns_policy
    ad_policy           = var.ad_policy
    template_properties = var.template_properties
}

module "vm" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/vsphere//vm"
  hostname      = module.onefuse.hostname
  template      = module.onefuse.template
  ip_address    = module.onefuse.ip_address
  network       = module.onefuse.network
  gateway       = vmodule.onefuse.gateway
  dns_suffix    = module.onefuse.dns_suffix
  folder        = "VRM-BACKUPEXCLUDED/pre-sales-demo/"
  subnet        = local.IPv4_Netmask
  cpu           = local.cpu
  memMb         = locaL.memMb
}