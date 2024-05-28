# Optional Profile to pass in provider and backend file.
variable "profile" {
  type = string
  # default = "harsh"
}

# Region to configure for deploying resources.
variable "region" {
  type    = string
  default = "us-west-2"
  # sensitive = true
}

# Elastic container Registry name
variable "ecr_repo" {
  type = string
}

# Container port to avail our app on that port and for tg.
variable "container-port" {
  type    = number
  default = 3000
}

# Egress rule block IP for accessing from anywhere on internet.
variable "anywhere" {
  default = "0.0.0.0/0"
}

# Account id is used in ECS task definition for specify image.
variable "account_id" {
  # default = 831794387446
  # default = 471112736114
  sensitive = true
}

# Creating Local Image name.
variable "local-image" {
  type    = string
  default = "containercruise"
  # default = "authcontainer"
}

# we used this because it was giving me error when we give container name which contains slash
variable "container-name" {
  type = string
  # default = "authcontainer"
  default = "containercruise"
}

# RDS Database Username 
variable "username" {
  type = string
  # sensitive = true
}

# Rds Database Password
variable "password" {
  type      = string
  sensitive = true
}

# RDS DB port for accessing DB.
variable "db_port" {
  type    = number
  default = 5432
}

# Optional Now as we have configured modules of subnet.
variable "private_subnets" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.4.0/24"]
}

# Optional Now as we have configured modules of subnet.
variable "az" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

# Optional Now as we have configured modules of subnet.
variable "public_subnets" {
  type    = list(string)
  default = ["10.0.2.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}

# Environtment for Github actions and giving resource name.
variable "environment" {
  type = string
}

# Image tag to specify for pushing image.
variable "tag" {
  type = string
}