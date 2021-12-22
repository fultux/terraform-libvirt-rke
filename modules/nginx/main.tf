resource "libvirt_volume" "os_image" {
  name   = "os_image"
  source = "https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.3/images/openSUSE-Leap-15.3.x86_64-NoCloud.qcow2"
}


resource "libvirt_volume" "volume" {
  name   = "volume-lb"
  pool   = "default"
  base_volume_id = libvirt_volume.os_image.id
}

#data "template_file" "lb_user_data" {
#  template = file("${path.module}/templates/cloud_init.cfg")
#     vars = {
#    lb_ssh_user = var.lb_ssh_user
#    lb_ssh_key = var.lb_ssh_key
#    node_hostname = "lb"
#    worker_ip = "${var.worker_ip}"
#  }
#}


data "template_file" "network_config" {
  template = file("${path.module}/templates/network_config.cfg")
  vars = {
    ip_lb="10.24.10.253"
  }
}

resource "libvirt_cloudinit_disk" "lb" {
  name  = "cloudinit-lb.iso"
  user_data = templatefile("${path.module}/templates/cloud_init.tftpl", {
      lb_ssh_user = var.lb_ssh_user,
      lb_ssh_key = var.lb_ssh_key,
      node_hostname = var.lb_name,
      worker_ip = var.worker_ip
    })
  network_config = data.template_file.network_config.rendered
}


#Create the controler node
resource "libvirt_domain" "lb" {
  name = var.lb_name
  disk {
    volume_id = libvirt_volume.volume.id 
  }
  memory = var.lb_memory
  vcpu   = var.lb_vcpu

  cloudinit = libvirt_cloudinit_disk.lb.id

  network_interface {
    network_name = "rancher_network" 
    hostname       = var.lb_name
    addresses      = [var.lb_ip]
    wait_for_lease = true 
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
