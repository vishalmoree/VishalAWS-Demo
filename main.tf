provider "aws" {
  region  = "eu-north-1"
  }

resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t3.micro"

  tags = {
    Name = "JacksBlogExample"
  }
}
