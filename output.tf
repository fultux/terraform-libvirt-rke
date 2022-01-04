output "ip_nodes" {
  value = tolist(module.kvm.nodes_ips)
}

output "ip_lb" {
  value = module.nginx.ip_lb
}


output "rancher_url" {
  value = "https://${var.url}"
}
