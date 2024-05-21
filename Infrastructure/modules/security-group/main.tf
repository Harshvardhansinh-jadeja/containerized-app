resource "aws_security_group" "gen_security_group" {
  name        = var.name
  description = var.desc
  vpc_id      = var.vpc

  tags = {
    Name = var.name
  }

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      description     = ingress.value.description
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = "tcp"
      security_groups = ingress.value.security_groups
      cidr_blocks     = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules

    content {
      cidr_blocks     = egress.value.cidr_blocks
      security_groups = egress.value.security_groups
      protocol        = egress.value.protocol
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
    }
  }

}

# resource "aws_vpc_security_group_ingress_rule" "ingress-3000-alb" {
#   security_group_id = module.harshvardhan-alb-sg.sg_id
#   cidr_ipv4         = var.anywhere
#   from_port         = 3000
#   ip_protocol       = "tcp"
#   to_port           = 3000
# }
# resource "aws_vpc_security_group_ingress_rule" "ingress-80-alb" {
#   security_group_id = module.harshvardhan-alb-sg.sg_id
#   cidr_ipv4         = var.anywhere
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4-alb" {
#   security_group_id = module.harshvardhan-alb-sg.sg_id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }   