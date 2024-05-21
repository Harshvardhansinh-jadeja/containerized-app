# Subet Group module for Database deployment in private subnets.
module "harshvardhan-sub-group" {
  source = "./modules/subnet-group"
  # subnets = [aws_subnet.harshvardhan-private-subnets[0].id, aws_subnet.harshvardhan-private-subnets[1].id, aws_subnet.harshvardhan-private-subnets[2].id]
  subnets = [module.harshvardhan-private-sub-1.id, module.harshvardhan-private-sub-2.id, module.harshvardhan-private-sub-3.id]
  name    = "${var.environment}-sub-group"

}