resource "aws_instance" "web02" {
  provider = aws.dest_region
  ami = aws_ami_copy.copying_ami.id
  instance_type = "t2.micro"
  key_name = "nv-key"
  availability_zone = "us-east-1b"
  vpc_security_group_ids = ["sg-0ac826f96d17e2395"]
  tags = {
    Name = "Dest_webserver"
  }
}

resource "aws_key_pair" "nv_key" {
  provider = aws.dest_region
  key_name = "nv-key"
  public_key = file("C:\\Users\\MADHAVA\\Downloads\\sshkeys\\provision.pub")
}
