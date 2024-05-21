output "public_ip" {
  value = aws_instance.gen_ec2.public_ip
}

output "private_ip" {
  value = aws_instance.gen_ec2.private_ip
}