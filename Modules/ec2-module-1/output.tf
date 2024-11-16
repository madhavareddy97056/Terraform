output "m1_public_ip" {
  value = aws_instance.module-1-ec2.public_ip
}

output "m1_public_dns" {
  value = aws_instance.module-1-ec2.public_dns
}
