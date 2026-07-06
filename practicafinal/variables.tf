variable "region" {
  description = "Región de AWS por workspace"
  type        = map(string)
  default = {
    "dev"  = "us-east-1"
    "prod" = "us-east-2"
  }

}
variable "ami" {
  description = "AMI por workspace"
  type        = map(string)
  default = {
    "dev"  = "ami-033b95fb8079dc481"
    "prod" = "ami-0b614a5d911900a9b"
  }
}

variable "instance" {
  description = "Tipo de instancia EC2 por workspace"
  type        = map(string)
  default = {
    "dev"  = "t3a.nano"
    "prod" = "t3a.micro"
  }
}

variable "vpc_cidr" {
  description = "CIDR del VPC por workspace"
  type        = map(string)
  default = {
    "dev"  = "10.0.0.0/24"
    "prod" = "10.0.0.0/24"
  }
}

variable "subnet_cidr" {
  description = "CIDR de la subnet por workspace"
  type        = map(string)
  default = {
    "dev"  = "10.0.0.0/28"
    "prod" = "10.0.0.0/28"
  }
}

variable "tags" {
  description = "Tags con nombre del estudiante"
  type        = map(string)
  default = {
    "owner" = "Alejandro Romero Vargas"
  }
}

