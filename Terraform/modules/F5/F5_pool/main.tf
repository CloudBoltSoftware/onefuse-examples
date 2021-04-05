terraform {
  required_providers {
    onefuse = {
      source  = "CloudBoltSoftware/onefuse"
      version = ">= 1.20.0"
   }
   bigip = {
      source = "F5Networks/bigip"
      version = "1.8.0"
    }
  }
  required_version = ">= 0.13"
}

resource "bigip_ltm_pool" "pool" {
    name = local.pool
    monitors = [local.monitors]
    allow_nat = local.allow_nat
    allow_snat = local.allow_snat
    load_balancing_mode = local.load_balancing_mode
}