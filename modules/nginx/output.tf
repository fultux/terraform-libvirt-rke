output "ip_lb" {
  value = flatten(libvirt_domain.lb.*.network_interface.0.addresses)
}
