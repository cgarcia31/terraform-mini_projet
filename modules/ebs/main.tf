resource "aws_ebs_volume" "ebs" {
  availability_zone = var.az
  size              = var.ebs_size
  tags = {
    Name = var.ebs_name
  }
  type = var.volume_type
}

# The attachment of the ebs volume
# Here because the ebs volume have to be created after the instance (to get the avaibility_zone)
resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = var.instance_id
}
