variable node_count {
  type        = number
  description = "Number of nodes to be provisioned"
}

variable node_memory {
  type        = string
  description = "The amount of RAM for each nodes"
}

variable node_vcpu {
  type        = number
  description = "Number of vcpu for the nodes"
}


variable node_ssh_key {
  type        = string
  description = "SSH key to add to the cloud-init for user access"
}

variable node_ssh_user {
  type        = string
  description = "SSH key to add to the cloud-init for user access"
}

variable "ssh_key_file" {
    type = string
    description = "ssh key"
    default = "~/.ssh/id_rsa"
}

variable "hostname_pattern" {
  type    = string
  default = "node-%02d"
}


variable "node_disk_size" {
    type = number
    description = "Disk size for the nodes in Bytes"
    default = 32212254720

}