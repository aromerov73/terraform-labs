variable "key_name" {
  type        = string
  description = "Nombre del archivo pem que guardará la clave SSH privada"
}

variable "bucket_name" {
  type        = string
  description = "Nombre único a nivel global para el bucket de S3"
}

variable "student_name" {
  type        = string
  description = "Nombre del estudiante para identificar la VPC"
}