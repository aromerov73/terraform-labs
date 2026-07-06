resource "aws_instance" "vm" {
  ami                         = var.ami
  instance_type               = var.instancia
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

vpc_security_group_ids = [
  var.security_group_id
]

  tags = {
    owner = var.tags["owner"]
    Name  = "${terraform.workspace}-vm"
  }
}