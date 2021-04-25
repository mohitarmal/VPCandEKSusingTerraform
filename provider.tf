provider "aws" {
  access_key = "AWS_ACCESS_KEY_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY"
  region = "region"
  version = ">= 2.38.0"
}

resource "aws_vpc" "demo" {
  cidr_block       = "190.160.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo"
  }
}

resource "aws_subnet" "demopublic" {
  count = 2
  
  cidr_block        = "10.160.6${count.index}.0/24"
  vpc_id            = aws_vpc.demo.id
  map_public_ip_on_launch = "true"

  tags = {
    Name = "PublicSubnet${count.index}",
    }
}

resource "aws_subnet" "demoprivate" {
  count = 2

  cidr_block        = "10.160.${count.index}.0/24"
  vpc_id            = aws_vpc.demo.id

  tags = {
    Name = "PrivateSubnet${count.index}",
    }
}
