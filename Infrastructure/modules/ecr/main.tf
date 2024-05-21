resource "aws_ecr_repository" "gen-repo" {
  name         = var.name
  force_delete = var.force_delete
}