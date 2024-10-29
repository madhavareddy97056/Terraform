provider "aws" {
  region = "ap-south-1"
}

locals {
  common_tags_USA = {
    Name     = "USA_project"
    Location = "chicago"
    Owner    = "john"
  }
}

locals {
  common_tags_INDIA = {
    Name     = "India_project"
    Location = "Hyderabad"
    Owner    = "Madhava"
  }
}

resource "aws_instance" "server-1" {
  ami                    = "ami-04a37924ffe27da53"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1b"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags                   = local.common_tags_USA
}

resource "aws_vpc" "new_vpc" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"
  tags             = local.common_tags_USA
}

resource "aws_ebs_volume" "new_volume" {
  availability_zone = "ap-south-1b"
  size              = 10
  tags              = local.common_tags_USA
}


resource "aws_instance" "server-india" {
  ami                    = "ami-04a37924ffe27da53"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1b"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags                   = local.common_tags_INDIA
}

resource "aws_vpc" "new_vpc_india" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"
  tags             = local.common_tags_INDIA
}

resource "aws_ebs_volume" "new_volume_india" {
  availability_zone = "ap-south-1b"
  size              = 10
  tags              = local.common_tags_INDIA
}