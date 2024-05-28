# Module for Creating Elastic Ip address.
module "harshvardhan-eip" {
  source  = "../modules/eip"
  name    = "${var.environment}-eip"
  depends = module.harshvardhan-igw
}

# Module for Creating NAT Gateway.
module "harshvardhan-ngw" {
  source  = "../modules/nat"
  name    = "${var.environment}-ngw"
  depends = module.harshvardhan-igw
  subnet  = module.harshvardhan-pub-sub-1.id
  eip     = module.harshvardhan-eip.eip_id
}
