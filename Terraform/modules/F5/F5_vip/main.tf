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

resource "bigip_ltm_virtual_server" "vip" {
  name        = local.virtualserver
  destination = var.destination_address
  port        = local.vip_port
  pool        = local.pool
  ip_protocol = local.vip_ip_protocol
  source_address_translation = local.vip_source_address_translation
}