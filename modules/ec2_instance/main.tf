resource "aws_instance" "ec2" {
  ami           = data.aws_ami.app_ami.image_id
  instance_type = var.instance_type
  tags = {
    "Name" = var.instance_name
  }
  key_name               = var.key_name
  user_data              = var.user_data
}

resource "aws_eip_association" "allocation-eip" {
  count         = var.eip_count
  instance_id   = aws_instance.ec2.id
  allocation_id = var.eip_id
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
	security_group_id    = var.security_group_id
	network_interface_id = aws_instance.ec2.primary_network_interface_id
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
