terraform {
  required_version = "~>1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai-region"
}

provider "aws" {
  region = "us-east-1"
  alias  = "nv-region"
}