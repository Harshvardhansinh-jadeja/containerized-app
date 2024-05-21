# Module for Internet Gateway
module "harshvardhan-igw" {
  source = "./modules/igw"
  vpc    = module.harshvardhan-vpc.vpc_id
  name   = "${var.environment}-igw"
}
# comment