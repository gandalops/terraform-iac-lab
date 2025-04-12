output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.env_ec2.public_ip
}

output "environment" {
  description = "Deployed environment"
  value       = var.environment
}
