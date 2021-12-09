variable main_count {
  type        = number
  default = 1
  description = "Number of nodes to be provisioned"
}

variable main_node_memory {
  type        = string
  description = "The amount of RAM for each nodes"
}

variable main_node_vcpu {
  type        = number
  description = "Number of vcpu for the nodes"
}

variable node_count {
  type        = number
  description = "Number of nodes to be provisioned"
}

variable worker_node_memory {
  type        = string
  description = "The amount of RAM for each nodes"
}

variable worker_node_vcpu {
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


