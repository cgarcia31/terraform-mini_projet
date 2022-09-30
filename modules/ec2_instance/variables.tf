variable "instance_type" {
  type        = string
  description = "Modele of the instance"
}

variable "instance_name" {
  type        = string
  description = "Tag Name"
}

variable "key_name" {
  type        = string
  description = "Key Name"
}

variable "security_group_id" {
  type        = string
  description = "Security Group to attach to the instance"
}

variable "user_data" {
  type        = string
  description = "Script Name"
  default     = ""
}

variable "eip_count" {
  type        = number
  default     = 0
  description = "Create or not create eip"
}

variable "eip_id" {
  type        = string
  description = "EIP id"
  default     = ""
}

