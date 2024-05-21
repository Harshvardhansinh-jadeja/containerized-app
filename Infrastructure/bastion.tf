# Module for Creating EC2 Instances.
module "bastion_host" {
  source        = "./modules/ec2"
  subnet_id     = module.harshvardhan-pub-sub-1.id
  name          = "${var.environment}-bastion"
  instance_size = "t2.micro"
  sg_ids        = [module.harshvardhan-bastion-sg.sg_id]
}

# another way to create key pair 
# resource "tls_private_key" "rsa-4096-example" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "harshvardhan-key" {
#   key_name   = "harshvardhan-key"
#   public_key = tls_private_key.rsa-4096-example.public_key_openssh
# }