variable "ami" {
  description = "AMI por workspace"
  type        = string
}

variable "instancia" {
  type = string
}

variable "subnet_id" {
  description = "CIDR de la subnet por workspace"
  type        = string
}

variable "tags" {
  description = "Tags con nombre del estudiante"
  type        = map(string)
}

variable "security_group_id" {
  description = "ID del Security Group asociado a la vm"
  type = string
}