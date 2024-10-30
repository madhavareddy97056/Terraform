provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "keypair_pub" {
  key_name   = "provisionkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDY3ThgTNL5+qHoW1q0EHHS2eEuK8H1QxnE/WOqvkdyYxaqA4797Kam69tDjHNkNMJxi4dgqy8AdUxJW0TVq5p0QhUyLGaCbJTngddZB9Z3/yoIlEHcnm68229+3Ak8Bz3OEM9EXY5lLQUXeMKbSlSI37ASUMbQZv7S8zDcwrHCMpb/pbmI9cXe0r38jtwno6ka8QZ1Zld74AjR+IgpqbR8TLIkhueldj81Xns6Bj/kHszOHOdKVfUVvpHZZvXH2hPFxebr8QFSIvGK6uKI6fSMohk4H2Sv8ZzbT5Q60erEfQok5hQtLybEHm76LCsvAw7Zq16MKjkJ5owBZ6HaIPKd/gB5Nmd+xDrmbPBKa0MjMKsQPlGZYzlWonLQqwMJL2umT3XJrPVtW8JmShOYW+h/N0Uzjrf6Lw7EikxebHQ877yXpKJzJ9ifpnxouYJ67CAiVdNd6XoX/KrrcWQ3qfccvfG89lZ8k01OOElXV1bHwdc0kMdUt+nHNIRCPCW/BD0= madhava@MADHAVA-HP"
}

resource "aws_instance" "webserver_amazon_linux" {
  ami                    = "ami-04a37924ffe27da53"
  availability_zone      = "ap-south-1a"
  instance_type          = "t2.micro"
  key_name               = "provisionkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "amazon_web_server"
  }

  provisioner "file" {
    source     = "C:\\Users\\MADHAVA\\Downloads\\2100_artist"
    destination = "/tmp/2100_artist"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo cp -r /tmp/2100_artist/* /var/www/html/",
      "sudo systemctl restart httpd",
      "sudo systemctl enable httpd"
    ]
  }

  connection {
    host        = self.public_ip
    user        = "ec2-user"
    type        = "ssh"
    private_key = file("C:\\Users\\MADHAVA\\Downloads\\sshkeys\\provision")
  }
}





