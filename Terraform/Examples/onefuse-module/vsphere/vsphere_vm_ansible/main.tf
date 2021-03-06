module "onefuse" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git?ref=v1.2-beta.1"
    name_policy         = var.name_policy
    ipam_policy         = var.ipam_policy
    dns_policy          = var.dns_policy
    ad_policy           = var.ad_policy
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

module "ansible_job" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git//ansible?ref=v1.2-beta.1"
    policy = var.ansible_policy
    hostname = local.fqdn
    limit = local.fqdn
    template_properties = var.template_properties
    depends_on = [module.vm]
}