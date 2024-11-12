resource "aws_instance" "server-1" {
  ami                    = "ami-0dee22c13ea7a9a67"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  key_name               = "linuxkey"
  tags = {
    Name = "lifecycle-server"
  }
  lifecycle {
    create_before_destroy = true
  }
  lifecycle {
    prevent_destroy = true
  }
 lifecycle {
    ignore_changes = [tags]
  }
}