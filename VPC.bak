#creating AWS VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "testVPC"
  }
}

#creating subnet
resource "aws_subnet" "TestSubnetPublic" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-north-1a"
  tags = {
    Name = "TestSubnetPublic"
  }
}

resource "aws_subnet" "TestSubnetPrivate" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-north-1a"
  tags = {
    Name = "TestSubnetPrivate"
  }
}

resource "aws_subnet" "DevSubnetPublic" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-north-1b"
  tags = {
    Name = "DevSubnetPublic"
  }
}

resource "aws_subnet" "DevSubnetPrivate" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "eu-north-1b"
  tags = {
    Name = "DevSubnetPrivate"
  }
}

#Creating EC2 instance in subnet
resource "aws_instance" "ec2Test" {
  ami           = "ami-0d188df7cedce7d90" 
  instance_type = "t3.micro"
  key_name      = "demoec2keypair"  
  subnet_id     = aws_subnet.TestSubnetPrivate.id
  tags = {
    Name = "ec2Test"
  }
}

resource "aws_instance" "ec2Dev" {
  ami           = "ami-0d188df7cedce7d90" 
  instance_type = "t3.micro"
  key_name      = "NewEC2Pair"  
  subnet_id     = aws_subnet.DevSubnetPrivate.id
  tags = {
    Name = "ec2Dev"
  }
}