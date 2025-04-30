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
  availability_zone = "us-east-1a"
  tags = {
    Name = "TestSubnetPublic"
  }
}

resource "aws_subnet" "TestSubnetPrivate" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "TestSubnetPrivate"
  }
}

resource "aws_subnet" "DevSubnetPublic" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "DevSubnetPublic"
  }
}

resource "aws_subnet" "DevSubnetPrivate" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "DevSubnetPrivate"
  }
}

#Creating EC2 instance in subnet
resource "aws_instance" "ec2Test" {
  ami           = "ami-05f08ad7b78afd8cd" 
  instance_type = "t2.micro"
  key_name      = "NewVPC"  
  subnet_id     = aws_subnet.TestSubnetPrivate.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "ec2Test"
  }
}

resource "aws_instance" "ec2Dev" {
  ami           = "ami-05f08ad7b78afd8cd" 
  instance_type = "t2.micro"
  key_name      = "NewVPC"  
  subnet_id     = aws_subnet.DevSubnetPrivate.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id,aws_security_group.allow_all.id]
    tags = {
    Name = "ec2Dev"
  }
}

#Creating Security Groups
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  #cidr_ipv4         = aws_vpc.main.cidr_block
  cidr_ipv4         = "0.0.0.0/0"
  #from_port         = 443
  ip_protocol       = "-1"
  #to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allows_RDP" {
  security_group_id = aws_security_group.allow_tls.id  
  #cidr_ipv4         = aws_vpc.main.cidr_block
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3389
  ip_protocol       = "tcp"
  to_port           = 3389
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_all"
  }
}

#creating internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
 
  tags = {
    Name = "main"
  }
}

#Creating ALB in Public subnets
resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [aws_subnet.TestSubnetPublic.id,aws_subnet.DevSubnetPublic.id]

  enable_deletion_protection = true
}


