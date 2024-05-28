# # Terraform Version Specification.
terraform {
  required_providers {
    aws = {
      version = "~> 5.35.0"
    }
  }

  required_version = "~> 1.7"
}

# Fetching IAM Role for Task execution
data "aws_iam_role" "task_exec-role" {
  //for personal
  name = "ecsTaskExecutionRole"
  //for sandbox
  # name = "AmazonECSTaskExecutionRole"
}