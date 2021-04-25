provider "aws" {
  access_key = "AWS_ACCESS_KEY_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY"
  region = "region"
  version = ">= 2.38.0"
}

resource "aws_vpc" "demo" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo"
        Location = "Pune"
  }
}

resource "aws_subnet" "demopublic" {
  count = 2

  cidr_block        = "10.0.6${count.index}.0/24"
  vpc_id            = aws_vpc.demo.id
  map_public_ip_on_launch = "true"

  tags = {
    Name = "PublicSubnet${count.index}",
    }
}

resource "aws_subnet" "demo" {
  count = 2

  #availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = aws_vpc.demo.id

  tags = {
    Name = "PrivateSubnet${count.index}",
    }
}
