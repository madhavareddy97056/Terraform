resource "aws_instance" "mum-instance" {
  ami                    = "ami-08bf489a05e916bbd"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "linuxkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "mumbai-server"
  }
}

resource "aws_instance" "nv-instance" {
    provider = aws.nv-region
  ami                    = "ami-063d43db0594b521b"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  key_name               = "nv_key"
  vpc_security_group_ids = ["sg-07709164d640f6fda"]
  tags = {
    Name = "nv-server"
  }
}