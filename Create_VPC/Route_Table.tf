resource "aws_route_table" "pub_RT" {
  vpc_id = aws_vpc.vpc-only-terra.id
  tags = {
    Name = "custom_public_RT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
