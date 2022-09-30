variable "az" {
  type        = string
  description = "Zone avaibility for the ebs volume"
}

variable "ebs_size" {
  type        = number
  description = "size in Gib of the ebs volume"
}

variable "ebs_name" {
  type        = string
  description = "Name of the ebs volume"
}

variable "device_name" {
  type        = string
  description = "Name of the device type according to the operating system"
}

variable "instance_id" {
  type        = string
  description = "Id of the instance to attache the ebs volume"
}

variable "volume_type" {
  type        = string
  description = "Type of volume (standard/gp2/gp3/io1/io2..."
  default     = "gp2"
}

