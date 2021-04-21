output "node" {
  value = bigip_ltm_node.node
}

output "attach" {
  value = bigip_ltm_pool_attachment.attach_node
}
