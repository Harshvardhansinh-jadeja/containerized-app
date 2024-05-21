# module "harshvardhan-public-subnets" {
#   count = 3
#   source = "./modules/subnets"
#   vpc_id = module.harshvardhan-vpc.vpc_id
#   az =  var.az[count.index]
#   name = "${var.environment}-public-subnet-${count.index}"
#   cidr = var.public_subnets[count.index]
#   map_ip = true
# }
# module "harshvardhan-private-subnets" {
#   count = 3
#   source = "./modules/subnets"
#   vpc_id = module.harshvardhan-vpc.vpc_id
#   az =  var.az[count.index]
#   name = "${var.environment}-private-subnet-${count.index}"
#   cidr = var.private_subnets[count.index]
# }


# Module for Subnets.
module "harshvardhan-pub-sub-1" {
  source = "./modules/subnets"
  vpc_id = module.harshvardhan-vpc.vpc_id
  az     = "us-west-2a"
  name   = "${var.environment}-public-subnet-1"
  cidr   = "10.0.2.0/24"
  map_ip = true
}

# Public Subnet
module "harshvardhan-pub-sub-2" {
  source = "./modules/subnets"
  vpc_id = module.harshvardhan-vpc.vpc_id
  az     = "us-west-2b"
  name   = "${var.environment}-public-subnet-2"
  cidr   = "10.0.3.0/24"
  map_ip = true
}

# Public Subnet
module "harshvardhan-pub-sub-3" {
  source = "./modules/subnets"
  vpc_id = module.harshvardhan-vpc.vpc_id
  az     = "us-west-2c"
  name   = "${var.environment}-public-subnet-3"
  cidr   = "10.0.5.0/24"
  map_ip = true
}

# Private Subnet
module "harshvardhan-private-sub-1" {
  source = "./modules/subnets"
  vpc_id = module.harshvardhan-vpc.vpc_id
  az     = "us-west-2a"
  name   = "${var.environment}-private-subnet-1"
  cidr   = "10.0.0.0/24"
}

# Private Subnet
module "harshvardhan-private-sub-2" {
  source = "./modules/subnets"
  vpc_id = module.harshvardhan-vpc.vpc_id
  az     = "us-west-2b"
  name   = "${var.environment}-private-subnet-2"
  cidr   = "10.0.1.0/24"
}

# Private Subnet
module "harshvardhan-private-sub-3" {
  source = "./modules/subnets"
  vpc_id = module.harshvardhan-vpc.vpc_id
  az     = "us-west-2c"
  name   = "${var.environment}-private-subnet-3"
  cidr   = "10.0.4.0/24"
}


# resource "aws_subnet" "harshvardhan-public-subnets" {
#   count             = 3
#   vpc_id            = module.harshvardhan-vpc.vpc_id
#   cidr_block        = var.public_subnets[count.index]
#   availability_zone = var.az[count.index]
#   tags = {
#     Name = "${var.environment}-public-subnet-${count.index}",
#   }
#   map_public_ip_on_launch = true
# }

# resource "aws_subnet" "harshvardhan-private-subnets" {
#   count             = 3
#   vpc_id            = module.harshvardhan-vpc.vpc_id
#   cidr_block        = var.private_subnets[count.index]
#   availability_zone = var.az[count.index]
#   tags = {
#     Name = "${var.environment}-private-subnet-${count.index}",
#   }
# }

# resource "aws_subnet" "harshvardhan-private-subnet" {
#   vpc_id =module.harshvardhan-vpc.vpc_id
#   cidr_block = "10.0.0.0/24"
#   availability_zone = "us-west-2a"
#    tags = {
#     Name = "harshvardhan-private-subnet"
#   }
# }
# resource "aws_subnet" "harshvardhan-private-subnet-2" {
#   vpc_id =module.harshvardhan-vpc.vpc_id
#   cidr_block = "10.0.1.0/24"
#    availability_zone = "us-west-2b"
#   #  availability_zone = "us-west-2a"
#    tags = {
#     Name = "harshvardhan-private-subnet-2"
#   }
# }

# resource "aws_subnet" "harshvardhan-public-subnet" {
#   vpc_id =module.harshvardhan-vpc.vpc_id
#   cidr_block = "10.0.2.0/24"
#    availability_zone = "us-west-2a"
#    tags = {
#     Name = "harshvardhan-public-subnet"
#   }
#   map_public_ip_on_launch = true
# }
# resource "aws_subnet" "harshvardhan-public-subnet-2" {
#   vpc_id =module.harshvardhan-vpc.vpc_id
#   cidr_block = "10.0.3.0/24"
#    availability_zone = "us-west-2b"
#    tags = {
#     Name = "harshvardhan-public-subnet-2"
#   }
#   map_public_ip_on_launch = true
# }
