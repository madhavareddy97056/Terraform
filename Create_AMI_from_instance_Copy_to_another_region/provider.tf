terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  alias  = "source_region"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "dest_region"
  region = "us-east-1"
}