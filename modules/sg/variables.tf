variable "restricted_ip_ssh" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "public_sg_ports_ingress" {
  type = list(any)
}

variable "public_sg_ports_egress" {
  type = list(any)
}

variable "sg_name" {
  type = string
}

