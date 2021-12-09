output "ip_main" {
  value = module.kvm-nodes.main_ips
}

output "ip_nodes" {
  value = module.kvm-nodes.nodes_ips
}