provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2-instance" {
  ami                         = "ami-04a37924ffe27da53"
  count                       = 1
  instance_type               = "t2.micro"
  availability_zone           = "ap-south-1b"
  associate_public_ip_address = var.enable_pub_ip
  key_name                    = "linuxkey"
  vpc_security_group_ids      = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "Bool_var"
    Env  = "Test"
  }
}


variable "enable_pub_ip" {
  description = "Boolean variable"
  type        = bool
  default     = true
}