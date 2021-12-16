variable lb_memory {
  type        = string
  default     = 2048
  description = "The amount of RAM for the loadbalancer"
}

variable lb_vcpu {
  type        = number
  description = "Number of vcpu for the lb"
}


variable lb_ssh_key {
  type        = string
  description = "SSH key to add to the cloud-init for user access"
}

variable lb_ssh_user {
  type        = string
  description = "SSH key to add to the cloud-init for user access"
}


variable "worker_ip" {
    type = list
    description = "List of workers nodes ip"
}
