resource "aws_instance" "ebs_instance" {
  ami                    = "ami-0dee22c13ea7a9a67"
  instance_type          = "t2.micro"
  count                  = 1
  availability_zone      = "ap-south-1b"
  vpc_security_group_ids = [aws_security_group.sg-demo.id]
  tags = {
    Name = "ebs_test"
  }
  root_block_device {
    volume_size = 12
  }
}