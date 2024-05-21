resource "aws_db_subnet_group" "harshvardhan-sub-group" {
  name       = var.name
  subnet_ids = var.subnets

  tags = {
    Name = var.name
  }
}