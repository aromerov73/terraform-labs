variable "bucket_name" {
  type        = string
  description = "ARomeroV73"
  default     = "terraformlabs-test-bucket-1973" # Se recomienda cambiar este valor por uno único
}

variable "media_files" {
  type    = set(string)
  default = [
    "../../assets/demo_func01.png",
    "../../assets/demo_func02.jpg",
    "../../assets/demo_func03.png",
  ]
}