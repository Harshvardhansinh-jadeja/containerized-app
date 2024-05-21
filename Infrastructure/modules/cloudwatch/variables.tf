variable "name" {
  type = string
}

variable "comparison" {
  type = string
}

variable "evaluation" {
  type = number
}

variable "period" {
  type = number
}

variable "threshold" {
  type = number
}

variable "metric" {
  type = string
}

variable "namespace" {
  type = string
}

variable "statistic" {
  type = string
}

variable "description" {
  type = string
}

variable "alarm_action" {
  type = list(string)
}
variable "dimensions" {
  default = null
}