module "onefuse" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse"
    name_policy         = var.name_policy
    ipam_policy         = format("%s%s", module.location.properties.ipamLocation, module.environment.properties.ipamEnv)
    dns_policy          = module.environment.properties.dnsPolicy
    ad_policy           = module.environment.properties.adPolicy
    template_properties = var.template_properties
}

module "vm" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/vsphere//vm"
  hostname      = module.onefuse.hostname
  template      = module.os.properties.OneFuse_TF_Props.template
  ip_address    = module.onefuse.ip_address
  network       = module.onefuse.network
  gateway       = module.onefuse.gateway
  dns_suffix    = module.onefuse.dns_suffix
  folder        = local.vSphereFolder
  netmask       = local.IPv4_Netmask
  cpu           = local.cpu
  memMb         = local.memMb
}