output "instance_ip" {
  value = aws_instance.vm.public_ip
}

output "instance_id" {
  value = aws_instance.vm.id
}

output "instance_name" {
  value = aws_instance.vm.tags.Name
}

output "availability_zone" {
  value = aws_instance.vm.availability_zone
}
