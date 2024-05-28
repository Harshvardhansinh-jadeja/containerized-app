module "harshvardhan-repo" {
  source       = "../modules/ecr"
  name         = var.ecr_repo
  force_delete = false
}
