resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    owner = var.tags.owner
    Name  = "VPC ${terraform.workspace}"
  }
}

resource "aws_subnet" "subnet" {
  depends_on = [ aws_vpc.vpc ]
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  tags = {
    owner = var.tags.owner
    Name  = "Subnet ${terraform.workspace}"
  }
}