# Terraform Version Specification.
terraform {
  required_providers {
    aws = {
      version = "~> 5.35.0"
    }
  }

  required_version = "~> 1.7"
}

# AWS Provider 
provider "aws" {
  profile = "sandbox"
  region  = var.region
  # you can use multiple accounts to access this infastructure using this
  # allowed_account_ids = 
}


# Fetching IAM Role for Task execution
data "aws_iam_role" "task_exec-role" {
  //for personal
  name = "ecsTaskExecutionRole"
  //for sandbox
  # name = "AmazonECSTaskExecutionRole"
}