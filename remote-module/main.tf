
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name = "remote-module-ec2"

  instance_type = "t2.micro"
  ami           = "aami-02dfbd4ff395f2a1b"

  tags = {
    Terraform = "true"
  }
}