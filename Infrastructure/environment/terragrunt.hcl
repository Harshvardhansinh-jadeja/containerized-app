remote_state {
  backend = "s3"
  generate = {
    path      = "backends.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "harshvardhan-terragrunt"
    key = "${path_relative_to_include()}/sandbox/terraform.tfstate"
    region = "us-west-2"
    profile = "sandbox"
  }
}


generate "provider" {
  path = "mains.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    region = "us-west-2"
    profile="sandbox"
  }
EOF
}