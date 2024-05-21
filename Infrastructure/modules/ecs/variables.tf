variable "name" {
  type = string
}

variable "family" {
  type = string
}

variable "container-name" {
  type = string
}

variable "image" {
  type = string
}

variable "container-port" {
  type = number
}

variable "role_arn" {
  type = string
}

variable "service_name" {
  type = string
}
variable "desired_count" {
  type = number
}
variable "tg_arn" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "aws_log" {
  type = object({
    logDriver : optional(string),
    options : object({
      awslogs-group : string,
      awslogs-region : string,
      awslogs-create-group : string,
      awslogs-stream-prefix : string
    })
  })
  default = null
}

variable "environment" {
  default = null
}
# variable "environment" {
#   type = list(object({
#      name : string
#      value: any
#   }))
#   default = []
# }
variable "secrets" {
  default = null
}