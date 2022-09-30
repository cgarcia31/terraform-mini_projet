variable "instance_type" {
  type        = string
  default     = "t2.nano"
  description = "Type d'image à utiliser"
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Region aws à utiliser"
}

variable "project_name" {
  type        = string
  default     = "project"
  description = "Project Name"
}

variable "public_sg_ports_ingress" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 443]
}
variable "public_sg_ports_egress" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [0]
}
