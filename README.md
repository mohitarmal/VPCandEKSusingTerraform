# VPCandSubnetcreationusingTerraform
Create VPC,2 public and 2 private subnets on AWS using Terraform

Recommended version:--> Terraform v0.12.17

Platform:- Linux
Required tools:
  1)awscli -->https://linuxtechlab.com/easy-way-to-install-aws-cli-on-linux/
  2)terraform -->https://www.cyberithub.com/how-to-install-terraform-on-centos-7/

Steps:
1)Create IAM role using aws console and save credentials.
2)Edit provider.tf file and update credentials and region.
3)terraform init -->to initialize a working directory containing Terraform configuration files
4)terraform plan -->used to create an execution plan
5)terraform apply
6)verify whether resources are created on aws or not.


