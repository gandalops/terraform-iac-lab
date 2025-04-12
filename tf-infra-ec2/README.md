# Terraform AWS EC2 Provisioning (DevSecOps Lab)

This project provisions a **minimal and secure AWS infrastructure** using Terraform.

### Infrastructure Components
- VPC
- Public Subnet
- Internet Gateway + Route Table
- Security Group (SSH on port 22 only)
- EC2 Ubuntu Instance (via existing `master.pem` key)

### How to Use

```bash
terraform init                         # Download provider plugins
terraform validate                     # Validate the config syntax
terraform fmt                          # Format code to standard style
terraform plan -out=secureinfra.plan   # Preview changes (safe plan)
terraform apply secureinfra.plan       # Apply infrastructure
