module "f5vip" {
    source = "git::https://https://github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/F5/F5_main"
    f5sps = var.policy
    template_properties = var.template_properties
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
  pool = module.f5vip.pool_name
  node = format("%s:%s", bigip_ltm_node.node.name, local.node_port)
  ratio = local.node_ratio
}