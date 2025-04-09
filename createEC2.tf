module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "DemoEC2-Terraform"

  instance_type          = "t3.micro"
  key_name               = "demoec2keypair"
  monitoring             = true
  vpc_security_group_ids = ["vpc-02460e626f5f259c6"]
  subnet_id              = "subnet-0c0d4b012bd90b593"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}