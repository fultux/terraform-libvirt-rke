output "nodes_ips" {
  value = flatten(libvirt_domain.node.*.network_interface.0.addresses)
}