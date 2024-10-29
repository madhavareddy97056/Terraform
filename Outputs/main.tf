resource "aws_instance" "test_output" {
  ami                    = "ami-04a37924ffe27da53"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "linuxkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "test_output-mc"
    ENV  = "dev"
  }
}
/*
output "show" {
  value = [aws_instance.test_output.id, aws_instance.test_output.public_ip, aws_instance.test_output.private_ip, aws_instance.test_output.public_dns]
}*/

output "instance_pub_ip" {
  value = aws_instance.test_output.public_ip
}

output "instance_pvt_ip" {
  value = aws_instance.test_output.private_ip
}

output "instance_ami" {
  value = aws_instance.test_output.ami
}

output "instance_pub_arn" {
  value = aws_instance.test_output.arn
  sensitive = true
}
