

resource "bigip_ltm_virtual_server" "vip" {
  name        = local.pool
  destination = "10.12.12.12"
  port        = 443
  pool        = local.pool
  ip_protocol = "tcp"
  client_profiles            = ["/Common/tcp", "/Common/clientssl"]
  server_profiles            = [""]
  source_address_translation = "automap"
  depends_on = [bigip_ltm_pool.terraform_test]
}


resource "bigip_ltm_pool" "pool" {
    name = local.virtualserver
    monitors = ["/Common/tcp"]
    allow_nat = "yes"
    allow_snat = "yes"
    load_balancing_mode = "least-connections-mmember"
}


resource "bigip_ltm_node" "node" {
  name             = "/Common/terraform_node1"
  address          = "192.168.30.1"
  connection_limit = "0"
  monitor          = "/Common/tcp"
  description      = "Test-Node"
  rate_limit       = "disabled"
  fqdn {
    address_family = "ipv4"
    interval       = "3000"
  }
}

resource "bigip_ltm_pool_attachment" "attach_node" {
  pool = bigip_ltm_pool.pool.name
  node = "${bigip_ltm_node.node.name}:80"
  ratio = "1"
}

/*
# A Virtual server with SSL enabled
resource "bigip_ltm_virtual_server" "https" {
  name                       = "/Common/terraform_vs_https"
  destination                = var.vip_ip
  description                = "VirtualServer-test"
  port                       = 443
  pool                       = var.pool
  profiles                   = ["/Common/tcp", "/Common/my-awesome-ssl-cert", "/Common/http"]
  source_address_translation = "automap"
  translate_address          = "enabled"
  translate_port             = "enabled"
}

# A Virtual server with separate client and server profiles
resource "bigip_ltm_virtual_server" "https" {
  name                       = "/Common/terraform_vs_https"
  destination                = "10.255.255.254"
  description                = "VirtualServer-test"
  port                       = 443
  client_profiles            = ["/Common/clientssl"]
  server_profiles            = ["/Common/serverssl"]
  source_address_translation = "automap"
}
*/