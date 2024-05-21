variable "subnet_id" {
  type = string
}
variable "name" {
  type = string
}
variable "sg_ids" {
  type = list(string)
}

variable "instance_size" {
  type = string
}