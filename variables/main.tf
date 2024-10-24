resource "aws_instance" "one" {
  ami                    = var.ami_id
  instance_type          = var.instanceType
  availability_zone      = var.availabilityZone
  key_name               = var.keyName
  count                  = var.val
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = var.server_name
    ENV  = "Dev"
  }
}