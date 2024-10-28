provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "marvel" {
  ami                    = "ami-04a37924ffe27da53"
  availability_zone      = "ap-south-1a"
  instance_type          = "t2.micro"
  key_name               = "linuxkey"
  vpc_security_group_ids = [aws_security_group.default_vpc_sg.id]
  tags = {
    Name = "bmr-server"
  }
}

# Dfault VPC
/*
resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Existing-default-vpc"
  }
} */

# crearing security_group in default vpc
resource "aws_security_group" "default_vpc_sg" {
  #vpc_id = aws_default_vpc.default_vpc.id
  name        = "terra_SG_default_VPC"
  description = "SG created by terraform"

  ingress {
    description = "ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "https port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "jenkins/tomcat port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All traffic allowed"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# creating elastic IP
resource "aws_eip" "eip_for_bmr-server" {
  # vpc      = true (depricated)
  instance = aws_instance.marvel.id
}