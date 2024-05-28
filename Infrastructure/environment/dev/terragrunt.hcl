remote_state {
  backend = "s3"
  generate = {
    path      = "dev-backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "harshvardhan-terragrunt"
    key = "${path_relative_to_include()}/dev/terraform.tfstate"
    region = "us-west-2"
    # profile="sandbox"
  }
}


generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    region = "us-west-2"
    # profile= "sandbox"
  }
EOF
}

terraform {
  source = "../..//stack/"
}
