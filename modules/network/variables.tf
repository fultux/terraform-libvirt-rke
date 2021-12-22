variable "subnet" {
    type =  string
    description = "Rancher base subnet"
}

variable "subnet_mask" {
    type = string
    description = "Subnet mask"
}


variable "lb_name" { 
    type = string
    description = "Name of the loadbalancer"
}


variable "lb_ip" {
  type = string
  description = "Loadbalancer ip"
}