resource "libvirt_network" "rancher_network" {
  name = "rancher_network"
  mode = "nat"
  autostart = true
  addresses = ["10.24.10.0/24"]
  dhcp {
      enabled = true
  }
}