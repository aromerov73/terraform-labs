resource "local_file" "password" {
  content  = "Password: ${random_string.iac_random.id}"
  filename = "password.txt"
  directory_permission = "0600"
  file_permission = "0400"
}