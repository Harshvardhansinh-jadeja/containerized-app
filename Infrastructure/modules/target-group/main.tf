resource "aws_lb_target_group" "gen-tg" {
  name        = var.name
  port        = var.container-port
  protocol    = var.protocol
  target_type = var.tg_type
  vpc_id      = var.vpc_id
}
