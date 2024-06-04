# Using Local for creating IP address. 
locals {
  bastion_private_ip = "${module.bastion_host.private_ip}/32"
}

locals {
  image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.ecr_repo}:${var.tag}"
}