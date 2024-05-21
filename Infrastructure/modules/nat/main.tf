resource "aws_nat_gateway" "gen-ngw" {
  allocation_id = var.eip
  subnet_id     = var.subnet

  tags = {
    Name = var.name
  }
  depends_on = [var.depends]
}
