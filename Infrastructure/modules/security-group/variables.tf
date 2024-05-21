variable "name" {
  type = string
}


variable "desc" {
  type = string
}
variable "vpc" {
  type = string
}

variable "ingress_rules" {
  type = list(object({
    from_port       = number
    to_port         = number
    description     = optional(string)
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
  }))
}

variable "egress_rules" {
  type = list(object({
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
    protocol        = string
    from_port       = number
    to_port         = number
  }))

}