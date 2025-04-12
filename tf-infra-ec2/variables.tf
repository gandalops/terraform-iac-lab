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
