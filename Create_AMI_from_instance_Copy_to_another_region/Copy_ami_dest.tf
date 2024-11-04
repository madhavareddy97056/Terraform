resource "aws_ami_copy" "copying_ami" {
  provider          = aws.dest_region
  name              = "NV_AMI"
  source_ami_id     = aws_ami_from_instance.src_ami.id
  source_ami_region = "ap-south-1"
  tags = {
    Name = "NV_AMI_from_mumbai"
  }
}