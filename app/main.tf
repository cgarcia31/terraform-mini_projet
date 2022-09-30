# Terraform configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Load module eip to create an Elastic IP
module "eip" {
  source   = "../modules/eip"
  eip_name = "eip-${var.project_name}"
}

# Load module key_ssh to create a ssh_key
module "key_ssh" {
  source   = "../modules/key_ssh"
  key_name = "key-${var.project_name}"
}

# Load module sg to create a Security Group
module "sg" {
  source                  = "../modules/sg"
  sg_name                 = "${var.project_name}-sg"
  public_sg_ports_ingress = var.public_sg_ports_ingress
  public_sg_ports_egress  = var.public_sg_ports_egress
  restricted_ip_ssh       = ["${chomp(data.http.ip.body)}/32"]
}

# Load module ec2_instance to create an EC2 instance
module "ec2_instance" {
  source              = "../modules/ec2_instance"
  instance_type       = var.instance_type
  instance_name       = "ec2-${var.project_name}"
  key_name            = "key-${var.project_name}"
  security_group_id = module.sg.sg_id
  user_data           = data.local_file.user_data.content
  eip_count           = 1
  eip_id              = module.eip.eip_id
}

# Load module ebs to create an EBS instance
module "ebs" {
  source      = "../modules/ebs"
  ebs_size    = 10
  ebs_name    = "ebs-ec2-${var.project_name}"
  device_name = "/dev/xvdb"
  az          = module.ec2_instance.az
  instance_id = module.ec2_instance.instance_id
}

# Load the install_nginx.sh script in a data of type local_file
data "local_file" "user_data" {
  filename = "../user_data_scripts/install_nginx.sh"
}

# This part is to get your public ip for restrict the ssh access
data "http" "ip" {
  url = "http://icanhazip.com"
}

# Write infos in a file infos_ec2.txt
resource "local_file" "ec2_infos" {
	content         = "Instance ID : ${module.ec2_instance.instance_id} \n IP_Publique :  ${module.eip.eip_ip} \n AZ :  ${module.ec2_instance.az}"
	filename        = "infos_ec2.txt"
	file_permission = "0755"
}

