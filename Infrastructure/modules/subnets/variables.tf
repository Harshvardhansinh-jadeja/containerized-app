variable "vpc_id" {
  type = string
}

variable "cidr" {
  type = string
}

variable "az" {
  type = string
}

variable "name" {
  type = string
}

variable "map_ip" {
  type    = bool
  default = false
}