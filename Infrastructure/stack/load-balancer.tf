# Target Group Module for forwarding from ECS to ALB.
module "harshvardhan-tg" {
  source         = "../modules/target-group"
  name           = "${var.environment}-tg"
  container-port = var.container-port
  protocol       = "HTTP"
  tg_type        = "ip"
  vpc_id         = module.harshvardhan-vpc.vpc_id
}

# Module for Load balancer.
module "harshvardhan-alb" {
  source          = "../modules/load-balancer"
  name            = "${var.environment}-alb-service"
  internal        = false
  lb_type         = "application"
  subnets         = [module.harshvardhan-pub-sub-1.id, module.harshvardhan-pub-sub-2.id]
  security_groups = [module.harshvardhan-alb-sg.sg_id]

  balancer_port = "80"
  protocol      = "HTTP"
  tg_arn        = module.harshvardhan-tg.tg_arn
}
