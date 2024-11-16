provider "aws" {
  region = "ap-south-1"
}

module "module-1" {
  source = ".//ec2-module-1"
}

module "module-2" {
  source = ".//ec2-module-2"
}

module "module-3" {
  source = ".//s3-module"
}