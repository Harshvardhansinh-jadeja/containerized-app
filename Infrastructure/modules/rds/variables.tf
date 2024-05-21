variable "name" {
  type = string
}

variable "instance_class" {
  type = string
}
variable "storage_type" {
  type = string
}
variable "engine" {
  type = string
}
variable "public_access" {
  type = bool
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "db_name" {
  type = string
}
variable "storage" {
  type = number
}

variable "skip_final_snapshot" {
  type = bool
}

variable "apply_immediately" {
  type = bool
}

variable "subnet_grp_name" {
}

variable "vpc_sg" {
  type = list(string)

}