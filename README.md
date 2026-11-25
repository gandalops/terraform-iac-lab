# terraform-iac-lab

Two small Terraform labs on AWS that I built in April 2025 to practise infrastructure as code and basic security scanning.

## Status

Archived practice. The AWS account used for these labs has been closed, so the code has not been applied recently. To run it, you need your own AWS account.

## Labs

### tf-infra-ec2

Creates a VPC, a subnet, an internet gateway, a route table, a security group and one Ubuntu EC2 instance in eu-central-1. After a Checkov scan I tightened it: IMDSv2 required, encrypted root volume, detailed monitoring, EBS optimisation, SSH limited to one address and outbound traffic limited to HTTPS.

### tfvars-env-demo

Deploys an EC2 instance from environment specific variable files, such as dev and prod. It shows how to keep configuration out of the code. Real .tfvars files are ignored by Git. The file terraform.tfvars.example shows the format.

## Known gaps

- No VPC flow logs and no IAM instance profile.
- The subnet does not assign public IP addresses, so reaching the instance needs extra setup.
- No remote state backend.
- I addressed the Checkov findings but did not keep a scan report, so this repo does not claim a clean scan.

## How it was built

Commits come from two GitHub accounts on purpose. A second account acted as the developer, and this account acted as the central repository where I reviewed changes, to practise a team workflow.
