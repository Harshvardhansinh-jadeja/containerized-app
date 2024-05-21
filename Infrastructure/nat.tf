# Module for Creating NAT Gateway.
module "harshvardhan-ngw" {
  source  = "./modules/nat"
  name    = "${var.environment}-ngw"
  depends = module.harshvardhan-igw
  subnet  = module.harshvardhan-pub-sub-1.id
  eip     = module.harshvardhan-eip.eip_id
}
