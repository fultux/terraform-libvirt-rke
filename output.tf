output "ip_main" {
  value = tolist(module.kvm.main_ips)
}

output "ip_nodes" {
  value = tolist(module.kvm.nodes_ips)
}