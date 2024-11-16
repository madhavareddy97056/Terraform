output "m3-bucketname" {
  value = aws_s3_bucket.m3-bucket.bucket
}

output "m3-bucket-arn" {
  value = aws_s3_bucket.m3-bucket.arn
}