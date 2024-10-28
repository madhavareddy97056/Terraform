provider "aws" {
  region = "ap-south-1"
}

#1 creating vpc
resource "aws_vpc" "bonam_vpc" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "bmr_vpc"
  }
  enable_dns_hostnames = "true"
}

#2 creating public subnet
resource "aws_subnet" "sn-1" {
  tags = {
    Name = "pub-sn-20.0.1.0"
  }
  vpc_id                  = aws_vpc.bonam_vpc.id
  cidr_block              = "20.0.1.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = "true"
}

#3 creating internet gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.bonam_vpc.id
  tags = {
    Name = "bmr_IGW"
  }
}

#4 Creating route table 
resource "aws_route_table" "rt_custom" {
  vpc_id = aws_vpc.bonam_vpc.id
  tags = {
    Name = "custom_bmr_pub_RT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}

#5 Subnet associatins
resource "aws_route_table_association" "pub_rt_sn_association" {
  subnet_id      = aws_subnet.sn-1.id
  route_table_id = aws_route_table.rt_custom.id
}

#6 creating security_group
resource "aws_security_group" "bmr_vpc_sg" {
  vpc_id = aws_vpc.bonam_vpc.id
  tags = {
    Name = "terra-bmr-vpc-sg"
  }
  dynamic "ingress" {
    for_each = [22, 80, 443, 8080]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#7 Creating ec2 instance in public subnet
resource "aws_instance" "pub-instance" {
  ami                    = "ami-0dee22c13ea7a9a67"
  subnet_id              = aws_subnet.sn-1.id
  instance_type          = "t2.micro"
  key_name               = "linuxkey"
  vpc_security_group_ids = [aws_security_group.bmr_vpc_sg.id]
  tags = {
    Name = "bmr_pub_instance"
  }
}