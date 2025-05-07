terraform{
  required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  alias  = "east"
  }

provider "aws" {
  region  = "ap-south-1"
  alias  = "south"
  }


#resource "aws_instance" "example_server" {
#  ami           = "ami-0d188df7cedce7d90"
#  instance_type = "t3.micro"

 # tags = {
 #   Name = "JacksBlogExample"
 # }
#}
