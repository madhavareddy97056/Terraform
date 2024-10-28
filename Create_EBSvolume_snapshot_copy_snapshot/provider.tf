provider "aws" {
  alias = "src"
  region = "ap-south-1"
}

provider "aws" {
  alias = "dest"
  region = "us-east-1"
}