resource "aws_instance" "try_bool" {
    ami = "ami-04a37924ffe27da53"
    instance_type = var.itype ? "t2.micro" : "t2.medium"
    availability_zone = "ap-south-1b"
    vpc_security_group_ids = ["sg-0c0ad3acaaf86c600"]
    tags = {
        Name = "bool_mc"
    }
}


