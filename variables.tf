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


variable ssh_key {
  type        = string
  description = "SSH key to add to the cloud-init for user access"
}

variable ssh_user {
  type        = string
  description = "SSH key to add to the cloud-init for user access"
}

variable "ssh_key_file" {
    type = string
    description = "ssh key"
    default = "~/.ssh/id_rsa"
}


variable lb_memory {
  type        = string
  default     = 2048
  description = "The amount of RAM for the loadbalancer"
}

variable lb_vcpu {
  type        = number
  description = "Number of vcpu for the lb"
}

#variable "worker_ip" {
#    type = list

#    description = "List of workers nodes ip"
#}


variable "lb_name" {
  type = string
  description = "Hostname used for the loadbalancer"
  
}

variable "lb_ip" {
type = string
description = "Loadbalancer's ip"
}


variable "subnet_mask" {
  type = string
  description = "Hostname used for the loadbalancer"
  
}

variable "subnet" {
  type = string
  description = "Hostname used for the loadbalancer"
  
}

variable "url" {
    type = string
    description = "url to reach the loadbalancer (must have been setup on your host machine)"
}