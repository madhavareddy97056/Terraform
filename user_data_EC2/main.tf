provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "user_data_web" {
  ami                    = "ami-0dee22c13ea7a9a67"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1b"
  key_name               = "linuxkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "web_server_ubuntu"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo su
    apt update -y
    apt install apache2 wget unzip -y
    wget https://www.tooplate.com/zip-templates/2108_dashboard.zip
    unzip 2108_dashboard.zip
    cp -r 2108_dashboard/* /var/www/html
    systemctl restart apache2
    EOF
}

output "public_ip_addr" {
  value = aws_instance.user_data_web.public_ip
}