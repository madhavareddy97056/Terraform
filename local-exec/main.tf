provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "webserver_amazon_linux" {
  ami                    = "ami-04a37924ffe27da53"
  availability_zone      = "ap-south-1a"
  instance_type          = "t2.micro"
  key_name               = "linuxkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "amazon_server"
  }

  provisioner "local-exec"{
    command = "echo ${aws_instance.webserver_amazon_linux.public_ip} >> ip.txt"
  }
}