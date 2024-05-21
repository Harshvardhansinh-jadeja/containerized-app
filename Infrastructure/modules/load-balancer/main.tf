resource "aws_lb" "gen-alb-service" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.lb_type
  subnets            = var.subnets
  security_groups    = var.security_groups
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.gen-alb-service.arn
  port              = var.balancer_port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = var.tg_arn
  }

}