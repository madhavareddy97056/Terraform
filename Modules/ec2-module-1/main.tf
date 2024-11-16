resource "aws_instance" "module-1-ec2" {
  ami = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name = "provision"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = merge(var.tags, {
    Name = format("%s-server-%s", var.tags["module"], var.tags["os"] )
  })

  connection {
    type = "ssh"
    user = "ubuntu"
    host = self.public_ip
    private_key = file("C:\\Users\\MADHAVA\\Downloads\\sshkeys\\provision")
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo apt update",
        "sudo apt install apache2 wget unzip -y",
        "sudo wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip",
        "sudo unzip 2133_moso_interior.zip",
        "sudo cp -r 2133_moso_interior/* /var/www/html",
        "sudo systemctl restart apache2",
        "sudo systemctl enable apache2"
     ]
  }
}

resource "aws_key_pair" "key1" {
  key_name = "provision"
  public_key = file("C:\\Users\\MADHAVA\\Downloads\\sshkeys\\provision.pub")
}