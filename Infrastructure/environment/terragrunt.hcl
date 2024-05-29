remote_state {
  backend = "s3"

  config = {
    bucket  = "${local.tf_bucket}"
    key     = "${path_relative_to_include()}/${local.env}/terraform.tfstate"
    region  = "${local.aws_region}"
    profile = local.aws_profile
  }
}

locals {
  tf_bucket   = get_env("TF_VAR_tf_bucket")
  env         = get_env("TF_VAR_env")
  aws_profile = get_env("TF_VAR_profile")
  aws_region  = get_env("TF_VAR_aws_region")
}
