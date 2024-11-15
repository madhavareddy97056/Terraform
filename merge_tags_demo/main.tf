resource "aws_instance" "merge_tags_demo" {
  ami               = "ami-0dee22c13ea7a9a67"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name          = "linuxkey"
  tags = merge(var.tags, {
    Name = format("%s%d-server", var.tags["env"],var.tags["serial_no"])
  })
}

variable "tags" {
  type = map(string)
  default = {
    env            = "DEV"
    Project        = "swiggy"
    owner          = "madhava"
    country        = "india"
    cloud_provider = "AWS"
    serial_no = 5
  }
}