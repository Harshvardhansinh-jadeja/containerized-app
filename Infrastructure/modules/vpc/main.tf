resource "aws_vpc" "gen-vpc" {
  cidr_block = var.cidr
  tags = {
    Name = var.name
  }
}   