resource "local_sensitive_file" "tempfile" {
  for_each = toset(var.users)
  filename = each.value
  # count    = length(var.users)
  content = "password: S3cr3tP@ssw0rd"
}