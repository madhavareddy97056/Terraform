/* resource "aws_instance" "ebs_instance" {
  ami                    = "ami-0dee22c13ea7a9a67"
  instance_type          = "t2.micro"
  count                  = 1
  availability_zone      = "ap-south-1b"
  vpc_security_group_ids = ["sg-02cd4172d34747bc7"]
  tags = {
    Name = "ebs_test"
  }
  root_block_device {
    volume_size = 12
  }
} */

# creating EBS volume
resource "aws_ebs_volume" "root" {
  availability_zone = "ap-south-1b"
  size              = 15
  type = "gp3"

  tags = {
    Name = "terravol"
  }
}

# snapshot of EBS
resource "aws_ebs_snapshot" "test_snapshot" {
  volume_id = aws_ebs_volume.root.id

  tags = {
    Name = "Terra_vol_snapshot"
  }
}

#copying snapshot to another region
resource "aws_ebs_snapshot_copy" "copy_snapshot" {
  provider = aws.dest
  source_snapshot_id = aws_ebs_snapshot.test_snapshot.id
  source_region      = "ap-south-1"
  description = "snap from mum to nv"

  tags = {
    Name = "snap_from_mum"
  }
}