terraform {
  required_version = "~> 1.6.0"
}

provider "aws" {
  region = var.aws_region
}

# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "devsecops-vpc"
  }
}

# Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false
  tags = {
    Name = "public-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "devsecops-igw"
  }
}

# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

# Route Table Association
resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group - Batch 1
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.178.30/32"]         # Replace with your IP or IP range
    description = "Allow SSH from trusted IP"
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS traffic only"
  }

  tags = {
    Name = "ssh-sg"
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = "master"


monitoring                  = true                   # ✅ CKV_AWS_126
ebs_optimized               = true                   # ✅ CKV_AWS_135

metadata_options {                                  # ✅ CKV_AWS_79
    http_tokens              = "required"
    http_endpoint            = "enabled"
}

# iam_instance_profile        = aws_iam_instance_profile.web_profile.name  # ✅ CKV2_AWS_41

root_block_device {                                 # ✅ CKV_AWS_8
    volume_type           = "gp3"
    volume_size           = 8
    delete_on_termination = true
    encrypted             = true

}
  tags = {
    Name = "TerraformEC2"
  }
}

