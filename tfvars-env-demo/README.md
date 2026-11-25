# tfvars-env-demo

A small Terraform lab that deploys an EC2 instance from environment specific variable files. It shows how to keep configuration separate from code.

## How to use

Copy the example file and fill in your own values:

    cp terraform.tfvars.example dev.tfvars

Then run:

    terraform init
    terraform plan -var-file="dev.tfvars" -out=dev.plan
    terraform apply "dev.plan"

Use prod.tfvars in the same way for a production setup.

## Variables

| Variable | Purpose |
| --- | --- |
| ami_id | AMI to use for the instance |
| instance_type | Instance size, default t2.micro |
| key_name | Name of an existing SSH key pair |
| environment | Environment name, such as dev or prod |
| monitoring_enabled | Detailed monitoring, default off |

## Notes

- Real .tfvars files are ignored by Git. Only terraform.tfvars.example is stored.
- This lab does not create a security group or a network. It uses the account defaults, so it is for practice only.
- It needs your own AWS account.
