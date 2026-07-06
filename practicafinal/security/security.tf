resource "aws_security_group" "network_sg" {

  name = "${terraform.workspace}- nsg"

  vpc_id = var.vpc_id

  tags = {
    owner = var.tags.owner
    Name  = "${terraform.workspace}-nsg"
  }

}

resource "aws_vpc_security_group_ingress_rule" "ssh" {

  security_group_id = aws_security_group.network_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22

}

resource "aws_vpc_security_group_ingress_rule" "rdp" {

  security_group_id = aws_security_group.network_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 3389
  ip_protocol = "tcp"
  to_port = 3389

}

resource "aws_vpc_security_group_egress_rule" "all" {

  security_group_id = aws_security_group.network_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"

}

