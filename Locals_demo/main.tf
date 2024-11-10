#Creating locals
locals {
  bmr_tags = {
    Name    = "Madhava"
    Project = "swiggy"
    Env     = "dev"
  }
}

locals {
  mouni_tags = {
    Name    = "Mouni"
    Project = "zepto"
    Env     = "Test"
  }
}

resource "aws_instance" "bmr-instance" {
  ami               = "ami-08bf489a05e916bbd"
  instance_type     = "t2.micro"
  key_name          = "linuxkey"
  availability_zone = "ap-south-1a"
  tags              = local.bmr_tags
}

resource "aws_ebs_volume" "bmr_vol" {
  type              = "gp3"
  availability_zone = "ap-south-1a"
  size              = 5
  tags              = local.bmr_tags
}

resource "aws_instance" "mouni-instance" {
  ami               = "ami-0dee22c13ea7a9a67"
  key_name          = "linuxkey"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1b"
  tags              = local.mouni_tags
}

resource "aws_ebs_volume" "mouni_vol" {
  type              = "gp2"
  availability_zone = "ap-south-1b"
  size              = 5
  tags              = local.mouni_tags
}


