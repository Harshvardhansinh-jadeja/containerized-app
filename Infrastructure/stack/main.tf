# # Terraform Version Specification.
terraform {
  required_providers {
    aws = {
      version = "~> 5.35.0"
    }
  }

  required_version = "~> 1.7"
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

terraform {
  backend "s3" {}
}