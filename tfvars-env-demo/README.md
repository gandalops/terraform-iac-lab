# tfvars-env-demo

This is a Terraform mini-project to deploy EC2 instances using environment-specific `.tfvars` files. It demonstrates clean separation of code and configuration.

## 🔧 How to Use

```bash
terraform init
terraform plan -var-file="dev.tfvars" -out=dev.plan
terraform apply "dev.plan"

Swap dev.tfvars with prod.tfvars to deploy for production.

📦 Best Practice
- Keep .tfvars files local (not pushed)
- Use .tfvars.example for reference


