output "bucket_urls" {
  description = "Direcciones S3 de los objetos cargados"
  value = {
    for k, v in aws_s3_object.upload_media : k => "${v.bucket}.s3.amazonaws.com/${v.key}"
  }
}

output "instance_type_created" {
  description = "Tipo de instancia de cómputo asignado en AWS"
  value       = aws_instance.server.instance_type
}