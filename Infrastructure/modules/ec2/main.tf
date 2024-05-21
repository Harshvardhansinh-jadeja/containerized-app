# Find AMI_ID based on it's name and configuration.
data "aws_ami_ids" "ubuntu" {
  owners = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"]
  }

}
resource "aws_instance" "gen_ec2" {
  subnet_id               = var.subnet_id
  ami                     = data.aws_ami_ids.ubuntu.ids[0]
  instance_type           = var.instance_size
  disable_api_termination = false
  #   taken directly from the console
  key_name = "harsh-key"
  tags = {
    name = var.name
  }
  vpc_security_group_ids = var.sg_ids
}