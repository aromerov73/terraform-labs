output "instance_ip" {
  value = module.infra.instance_ip
}

output "instance_id" {
  value = module.infra.instance_id
}

output "instance_name" {
  value = module.infra.instance_name
}

output "availability_zone" {
  value = module.infra.availability_zone
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "owner" {
  value = var.tags.owner
}