resource "aws_instance" "web-1" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  key_name      = "linuxkey"
  tags = {
    Name = "demo-depend-on"
  }
  depends_on = [aws_s3_bucket.new-bucket]
}
resource "aws_s3_bucket" "new-bucket" {
  bucket = "bmr123bucket456"
  tags = {
    Name = "dev_bucket"
  }
}