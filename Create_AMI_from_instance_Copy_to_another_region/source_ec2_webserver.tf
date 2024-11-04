resource "aws_instance" "web01" {
  ami                    = "ami-0dee22c13ea7a9a67"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "linuxkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "src_webserver_ubuntu"
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo -i
    apt update
    apt install apache2 unzip wget -y
    cd /tmp/
    wget https://www.tooplate.com/zip-templates/2126_antique_cafe.zip
    unzip 2126_antique_cafe.zip
    cp -r 2126_antique_cafe/* /var/www/html/
    systemctl restart apache2
    systemctl enable apache2
    EOF
}