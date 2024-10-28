# creating AMI from existing instance
resource "aws_ami_from_instance" "ami_from_instance" {
  name               = "terra_ami"
  source_instance_id = "i-0ce92de97d0127a5e"
  tags = {
    Name = "terra_ami"
  }
}

# copying ami to another region
resource "aws_ami_copy" "example" {
  provider          = aws.dest
  name              = "ami_from_mum"
  description       = "A copy of mum image"
  source_ami_id     = aws_ami_from_instance.ami_from_instance.id
  source_ami_region = "ap-south-1"

  tags = {
    Name = "AMI_FROM_MUM"
  }
}