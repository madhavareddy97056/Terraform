resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-only-terra.id

  tags = {
    Name = "Terra_IGW"
  }
}