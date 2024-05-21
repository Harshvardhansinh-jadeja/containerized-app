resource "aws_eip" "gen-eip" {
  domain     = "vpc"
  depends_on = [var.depends]
  tags = {
    Name = var.name
  }
}