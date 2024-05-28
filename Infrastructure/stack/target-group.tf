# Target Group Module for forwarding from ECS to ALB.
module "harshvardhan-tg" {
  source         = "../modules/target-group"
  name           = "${var.environment}-tg"
  container-port = var.container-port
  protocol       = "HTTP"
  tg_type        = "ip"
  vpc_id         = module.harshvardhan-vpc.vpc_id
}