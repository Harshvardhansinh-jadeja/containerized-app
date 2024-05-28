# Module for Internet Gateway
module "harshvardhan-igw" {
  source = "../modules/igw"
  vpc    = module.harshvardhan-vpc.vpc_id
  name   = "${var.environment}-igw"
}

# Module to create VPC of capacity with 65536 IP address
module "harshvardhan-vpc" {
  source = "../modules/vpc"
  name   = "${var.environment}-vpc"
  cidr   = "10.0.0.0/16"
}