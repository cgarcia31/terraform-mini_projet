output "public_ip" {
  value = module.eip.eip_ip
}

output "instance_name" {
  value = module.ec2_instance.instance_name
}
