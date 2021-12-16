resource "libvirt_network" "rancher_network" {
  name = "rancher_network"
  mode = "nat"
  autostart = true
  addresses = ["${var.subnet}/${var.subnet_mask}"]
  dhcp {
      enabled = true
  }

  dns {

    enabled = true
    local_only = true


     hosts  {
         hostname = var.lb_name
         ip = var.lb_ip
       }
  }

  # (Optional) Dnsmasq options configuration
  #dnsmasq_options {
    # (Optional) one or more option entries.  Both of
    # "option_name" and "option_value" must be specified.  The format is:
    # options  {
    #     option_name = "server"
    #     option_value = "/base.domain/my.ip.address.1"
    #   }
    # options {
    #     option_name = "address"
    #     ip = "/.api.base.domain/my.ip.address.2"
    #   }
    #
 # }
}