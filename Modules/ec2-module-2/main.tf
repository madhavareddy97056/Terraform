resource "aws_instance" "module-2-ec2" {
  ami = "ami-0aebec83a182ea7ea"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1b"
  key_name = "provision"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = merge(var.tags, {
    Name = format("%s-server-%s", var.tags["module"], var.tags["OS"] )
  })

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("C:\\Users\\MADHAVA\\Downloads\\sshkeys\\provision")
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo yum install httpd wget unzip -y",
        "sudo systemctl start httpd",
        "sudo wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip",
        "sudo unzip 2136_kool_form_pack.zip",
        "sudo cp -r 2136_kool_form_pack/* /var/www/html",
        "sudo systemctl restart httpd",
        "sudo systemctl enable httpd"
     ]
  }
}
