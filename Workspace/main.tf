resource "aws_instance" "test-workspace" {
  ami               = "ami-0dee22c13ea7a9a67"
  instance_type     = var.inst_type
  availability_zone = var.az
  key_name          = "linuxkey"
  tags              = {
    Name = "${terraform.workspace}-server"
    Owner = "madhava"
  }
}
