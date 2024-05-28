# Fetching IAM Role for Task execution
data "aws_iam_role" "task_exec-role" {
  //for personal
  name = "ecsTaskExecutionRole"
  //for sandbox
  # name = "AmazonECSTaskExecutionRole"
}