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

resource "bigip_ltm_node" "node" {
  name             = var.name
  address          = var.address
  connection_limit = local.node_connection_limit
  description      = var.description
  rate_limit       = local.node_rate_limit
  fqdn {
    address_family = local.node_address_family
    interval       = "3000"
  }
}

resource "bigip_ltm_pool_attachment" "attach_node" {
  pool = var.pool
  node = format("%s:%s", bigip_ltm_node.node.name, local.node_port)
  ratio = local.node_ratio
}