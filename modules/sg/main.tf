resource "aws_security_group" "public" {
  name        = "${var.sg_name}-sg"
  description = "public security group"

  tags = {
    Name      = "${var.sg_name}"
    Role      = "public"
    ManagedBy = "terraform"
  }

  dynamic "ingress" {
    for_each = var.public_sg_ports_ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ingress.value == 22 ? var.restricted_ip_ssh : ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {

    for_each = var.public_sg_ports_egress
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
