# Printing ALB DNS to access our application
output "alb_DNS" {
  value = module.harshvardhan-alb.dns
}

# Public IP of EC2 Instance
output "bastion_public_IP" {
  value = module.bastion_host.public_ip
}

# RDS endpoint for using in PG admin.
output "endpoint" {
  # value = module.harshvardhan-rds.endpoint
  value = module.harshvardhan-rds.endpoint
}

