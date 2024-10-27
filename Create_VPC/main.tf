resource "aws_vpc" "vpc-only-terra" {
  tags = {
    Name = "Terrfaorm_VPC"
  }
  cidr_block           = "13.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
}