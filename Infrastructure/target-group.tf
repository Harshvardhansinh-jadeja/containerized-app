# Target Group Module for forwarding from ECS to ALB.
module "harshvardhan-tg" {
  source         = "./modules/target-group"
  name           = "${var.environment}-tg"
  container-port = var.container-port
  protocol       = "HTTP"
  tg_type        = "ip"
  vpc_id         = module.harshvardhan-vpc.vpc_id
}

# resource "aws_lb_target_group_attachment" "harshvardhan-tg-attachment" {
#   target_group_arn = aws_lb_target_group.harshvardhan-tg.arn
#   target_id        = aws_ecs_service.harshvardhan-service.id
#   port             = var.container-port
# } 