variable "instance_name" {
  type        = string
  description = "Nombre para identificar la instancia EC2"

  validation {
    # La condición debe cumplirse (evaluar a true) para que la variable sea válida
    condition     = length(var.instance_name) > 5
    error_message = "El nombre de la instancia debe ser mayor a 5 caracteres."
  }
}

variable "instance_size" {
  type        = string
  description = "Tamaño de la instancia de cómputo (opciones: nano, micro)"

  validation {
    condition     = var.instance_size == "nano" || var.instance_size == "micro"
    error_message = "El tamaño de la instancia seleccionado no es válido. Las opciones son: nano o micro."
  }
}

variable "instance_type_nano" {
  type    = string
  default = "t3a.nano"
}

variable "instance_type_micro" {
  type    = string
  default = "t3a.micro"
}