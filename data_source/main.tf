# To filter Ami
data "aws_ami" "data_img" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu*hvm*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

output "data_ami_id" {
  value = data.aws_ami.data_img.id
}