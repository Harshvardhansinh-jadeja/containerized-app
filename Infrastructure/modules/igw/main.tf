resource "aws_internet_gateway" "gen-igw" {
  vpc_id = var.vpc
  tags = {
    Name = var.name
  }
}
