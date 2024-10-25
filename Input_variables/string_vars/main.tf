provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2-instance" {
  ami                   = "ami-04a37924ffe27da53"
  instance_type         = var.instance_type
  availability_zone   = "ap-south-1b"
  key_name              = "linuxkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "string_var"
    Env  = "Test"
  }
}

variable "instance_type" {
  description = "String variable"
  type        = string
  default     = "t2.micro"
}