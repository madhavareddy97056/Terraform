resource "aws_subnet" "pub-sn" {
  vpc_id                  = aws_vpc.vpc-only-terra.id
  availability_zone       = "ap-south-1a"
  cidr_block              = "13.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_sn_1a_13.0.1.0"
  }
}
