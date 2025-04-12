provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "env_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring_enabled
  associate_public_ip_address = true

  tags = {
    Name        = "ec2-${var.environment}"
    Environment = var.environment
  }
}
