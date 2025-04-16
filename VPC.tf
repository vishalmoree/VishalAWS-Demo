#creating AWS VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "testVPC"
  }
}

#creating subnet
resource "aws_subnet" "TestSubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "TestSubnet1"
  }
}

resource "aws_subnet" "TestSubnetPublic" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "TestSubnetPublic"
  }
}

resource "aws_subnet" "TestSubnetPrivate" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "TestSubnetPrivate"
  }
}