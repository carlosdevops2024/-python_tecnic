terraform {
  backend "s3" {
    bucket         = "carlos-ortiz-s3"
    key            = "path/to/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
  required_version = ">= 1.4.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

variable "key_name" {
   default = "key_carlos_pem"
}

resource "aws_key_pair" "key_pair" {
  key_name    = var.key_name
  public_key  = tls_private_key.rsa_4096.public_key_openssh
}

resource "local_file" "private_key" {
  content   = tls_private_key.rsa_4096.private_key_pem
  filename  = var.key_name
}

resource "aws_instance" "my_iac_instance" {
  ami           = "ami-014d544cfef21b42d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key_pair.key_name

  tags = {
    Name   = "My IaC instance"
    Origin = "terraform"
  }
}

output "ec2_ip" {
  value = aws_instance.my_iac_instance.public_ip
}

output "ec2_dns" {
  value = aws_instance.my_iac_instance.public_dns
}

