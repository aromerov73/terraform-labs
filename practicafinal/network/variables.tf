variable "vpc_cidr" {
  description = "Rango de direcciones CIDR para la VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "Rango de direcciones CIDR para la subred"
  type        = string
}

variable "tags" {
  description = "Tags para identificar los recursos de red"
  type        = map(string)
}
