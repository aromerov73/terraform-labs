# Generación de la clave criptográfica privada
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Almacenamiento de la clave privada en un archivo local
resource "local_sensitive_file" "ssh_key_file" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${var.key_name}.pem"
}

terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "secure_storage" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.secure_storage.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "access" {
  depends_on = [aws_s3_bucket_ownership_controls.owner]
  
  bucket = aws_s3_bucket.secure_storage.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.owner, aws_s3_bucket_public_access_block.access]

  bucket = aws_s3_bucket.secure_storage.id
  acl    = "public-read"
}

resource "aws_s3_object" "upload_key" {
  bucket = aws_s3_bucket.secure_storage.id
  key    = "${var.key_name}.pem"
  source = local_sensitive_file.ssh_key_file.filename

  acl = "public-read"
}

resource "aws_vpc" "lab_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "lab-${var.student_name}"
  }
}
