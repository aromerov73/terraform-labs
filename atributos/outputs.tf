output "salida" {
  value = "Fecha y Hora: ${time_static.time_update.id}"
}

output "salida-full" {
  value = time_static.time_update
}

output "key" {
  value = tls_private_key.privateKey
  sensitive = true
}