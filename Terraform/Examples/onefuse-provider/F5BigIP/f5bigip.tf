resource "bigip_ltm_virtual_server" "vip" {
  name        = local.pool
  destination = onefuse_ipam_record.f5_ipam.ip_address
  port        = local.vip_port
  pool        = local.pool
  ip_protocol = local.vip_ip_protocol
  source_address_translation = local.vip_source_address_translation
  depends_on = [bigip_ltm_pool.pool]
}

resource "bigip_ltm_pool" "pool" {
    name = local.virtualserver
    monitors = [local.monitors]
    allow_nat = local.allow_nat
    allow_snat = local.allow_snat
    load_balancing_mode = local.load_balancing_mode
}

resource "bigip_ltm_node" "node" {
  name             = local.node
  address          = onefuse_ipam_record.ipam-record.ip_address
  connection_limit = local.node_connection_limit
  description      = "Test-Node"
  rate_limit       = local.node_rate_limit
  fqdn {
    address_family = local.node_address_family
    interval       = "3000"
  }
}

resource "bigip_ltm_pool_attachment" "attach_node" {
  pool = bigip_ltm_pool.pool.name
  node = format("%s:%s", bigip_ltm_node.node.name, local.node_port)
  ratio = local.node_ratio
}