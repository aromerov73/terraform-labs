resource "aws_s3_bucket" "media" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "upload_media" {
  for_each = var.media_files

  bucket = aws_s3_bucket.media.id
  source = each.value
  
  # La función substr extrae una subcadena del texto: substr(cadena, inicio, longitud)
  # "../../assets/demo_func01.png" -> se convierte en "assets/demo_func01.png"
  key    = substr(each.value, 6, 23)
}

resource "aws_instance" "server" {
  # Nota: El ID de la AMI y de la Subred son ejemplos de us-east-1.
  # Puede ser necesario actualizarlos con valores de su propia cuenta.
  ami           = "ami-033b95fb8079dc481"
  subnet_id     = "subnet-010205a1dea6ff7fc"

  # Condicional ternario: (condición ? si_verdadero : si_falso)
  instance_type = var.instance_size == "nano" ? var.instance_type_nano : var.instance_type_micro

  tags = {
    Name = var.instance_name
  }
}

