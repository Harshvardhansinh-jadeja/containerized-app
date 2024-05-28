# Module for Creating EC2 Instances.
module "bastion_host" {
  source        = "../modules/ec2"
  subnet_id     = module.harshvardhan-pub-sub-1.id
  name          = "${var.environment}-bastion"
  instance_size = "t2.micro"
  sg_ids        = [module.harshvardhan-bastion-sg.sg_id]
}