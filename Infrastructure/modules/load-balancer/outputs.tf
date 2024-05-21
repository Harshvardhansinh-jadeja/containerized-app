output "dns" {
  value = aws_lb.gen-alb-service.dns_name
}

output "arn_suffix" {
  value = aws_lb.gen-alb-service.arn_suffix

}