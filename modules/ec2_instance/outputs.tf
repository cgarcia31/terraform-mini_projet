output "ami_id" {
  value = data.aws_ami.app_ami.image_id
}

output "ami_name" {
  value = data.aws_ami.app_ami.name
}

output "instance_id" {
  value = aws_instance.ec2.id
}

output "az" {
  value = aws_instance.ec2.availability_zone
}

output "instance_name" {
  value = aws_instance.ec2.tags.Name
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}
