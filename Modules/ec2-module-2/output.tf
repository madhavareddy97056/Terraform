output "m2-pub-ip" {
  value = aws_instance.module-2-ec2.public_ip
}

output "m2-pub-dns" {
  value = aws_instance.module-2-ec2.public_dns
}