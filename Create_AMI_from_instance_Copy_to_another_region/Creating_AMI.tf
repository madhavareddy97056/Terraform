resource "aws_ami_from_instance" "src_ami" {
  name               = "mumbai_ami"
  source_instance_id = aws_instance.web01.id
  tags = {
    Name = "MUMBAI_AMI"
  }
}