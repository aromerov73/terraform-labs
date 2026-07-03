output "vpc_id" {
  description = "El ID de la VPC creada en AWS"
  value       = aws_vpc.lab_vpc.id
}

output "ssh_key_s3_url" {
  description = "La URL del objeto S3 que almacena la clave privada"
  value       = "${aws_s3_bucket.secure_storage.bucket}.s3.amazonaws.com/${aws_s3_object.upload_key.key}"
}