provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "madhava12345598"
}

resource "aws_s3_bucket_versioning" "versions" {
  bucket = aws_s3_bucket.test_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "owners" {
  bucket = aws_s3_bucket.test_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "acls" {
  depends_on = [aws_s3_bucket_ownership_controls.owners]
  bucket     = aws_s3_bucket.test_bucket.id
  acl        = "private"
}