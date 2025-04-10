terraform{
  required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region  = "eu-north-1"
  access_key = "AWS_ACCESS_KEY_ID_DEMO1"      
  secret_key = "AWS_SECRET_ACCESS_KEY_DEMO1"
  }

resource "aws_instance" "example_server" {
  ami           = "ami-0d188df7cedce7d90"
  instance_type = "t3.micro"

  tags = {
    Name = "JacksBlogExample"
  }
}
