variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "eu-central-1a"
}

variable "ami_id" {
  description = "AMI to use for EC2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_allowed_cidr" {
  description = "Single IP address allowed to SSH, in CIDR notation, for example 203.0.113.10/32"
  type        = string
}
