resource "aws_instance" "instance-1" {
  ami                    = "ami-08bf489a05e916bbd"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "linuxkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "vm-1"
  }
}

resource "aws_instance" "instance-2" {
  ami                    = "ami-08bf489a05e916bbd"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1b"
  key_name               = "linuxkey"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "vm-2"
  }
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "demotanitbuketbmr"
}

# terraform taint aws_instance.instance-1
# terraform apply
# terraform apply -replace="aws_instance.instance-2"