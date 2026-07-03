resource "local_file" "archivo" {
  filename        = var.filename
  file_permission = "0700"
  content         = "Contenido Modificado en Terraform"

lifecycle {
  create_before_destroy = false
  prevent_destroy = false
  ignore_changes = [ content, ]
}
}

moved {
  from = local_file.file
  to   = local_file.archivo
}