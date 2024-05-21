variable "name" {
  type = string
}
variable "internal" {
  type = bool
}
variable "lb_type" {
  type = string
}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}

variable "balancer_port" {
  type = string
}

variable "protocol" {
  type = string
}

variable "tg_arn" {
}