resource "libvirt_volume" "os_image" {
  name   = "os_image"
  source = "https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.3/images/openSUSE-Leap-15.3.x86_64-NoCloud.qcow2"
}


resource "libvirt_volume" "volume" {
  count  = var.node_count + var.main_count
  name   = "volume-${count.index}"
  pool   = "default"
  base_volume_id = libvirt_volume.os_image.id
}

data "template_file" "main_user_data" {
  count = var.main_count
  template = file("${path.module}/templates/cloud_init.cfg")
     vars = {
    node_ssh_user = var.node_ssh_user
    node_ssh_key = var.node_ssh_key
    node_hostname = "main-node-${count.index}"
  }
}



data "template_file" "node_user_data" {
  template = file("${path.module}/templates/cloud_init.cfg")
  count   = var.node_count
     vars = {
    node_ssh_user = var.node_ssh_user
    node_ssh_key = var.node_ssh_key
    node_hostname = "node-${count.index}"
  }
}

data "template_file" "network_config" {
  template = file("${path.module}/templates/network_config.cfg")
}

resource "libvirt_cloudinit_disk" "mainnode" {
  count = var.main_count
  name  = "cloudinit-main-${count.index}.iso"
  user_data      = data.template_file.main_user_data[count.index].rendered
  network_config = data.template_file.network_config.rendered
}

resource "libvirt_cloudinit_disk" "workernodes" {
  count = var.node_count
  name  = "cloudinit-node-${count.index}.iso"
  user_data      = data.template_file.node_user_data[count.index].rendered
  network_config = data.template_file.network_config.rendered
}

#Create the controler node
resource "libvirt_domain" "main" {
  count = var.main_count
  name = "main-${count.index}"
  disk {
    volume_id = libvirt_volume.volume[count.index].id 
  }
  memory = var.main_node_memory
  vcpu   = var.main_node_vcpu

  cloudinit = libvirt_cloudinit_disk.mainnode[count.index].id

  network_interface {
    network_name = "default" 
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


# Create the nodes
resource "libvirt_domain" "node" {
  name = "node-${count.index}"
  count= var.node_count
  disk {
    volume_id = element(libvirt_volume.volume.*.id, count.index +1 )
  }
  memory = var.worker_node_memory
  vcpu   = var.worker_node_vcpu

  cloudinit = libvirt_cloudinit_disk.workernodes[count.index].id

  network_interface {
    network_name = "default" 
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
