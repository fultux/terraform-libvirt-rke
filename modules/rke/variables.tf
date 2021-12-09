variable main_count {
  type        = number
  default = 1
  description = "Number of nodes to be provisioned"
}

variable node_count {
  type        = number
  description = "Number of nodes to be provisioned"
}


variable "main_ip" {    
    type = list
    description = "List of main nodes ip"
}

variable "worker_ip" {
    type = list
    description = "List of workers nodes ip"
}

variable "ssh_key_file" {
    type = string
    description = "ssh key"
    default = "~/.ssh/id_rsa"
}