# resource "aws_ssm_parameter" "username" {
#   name = "/harshvardhan/sandbox/rds/username"
#   type = "SecureString"
#   value = var.username
# }

# resource "aws_ssm_parameter" "password" {
#   name = "/harshvardhan/sandbox/rds/password"
#   type = "SecureString"
#   value = var.password
# }


# Optinal Now as we are using SSM parameters in Github Pipeline
data "aws_ssm_parameter" "username" {
  name = "/harshvardhan/${var.environment}/rds/username"
}

# Fetch the SSM parameter here and give arn of this into secrets of ECS.
# data "aws_ssm_parameter" "auth_secret" {
#   name = "/harshvardhan/sandbox/rds/auth_secret"
# }

# Optinal Now as we are using SSM parameters in Github Pipeline
data "aws_ssm_parameter" "password" {
  name = "/harshvardhan/${var.environment}/rds/password"
}

# Creating Database URL for passing as env in task definition
resource "aws_ssm_parameter" "url" {
  name = "/harshvardhan/${var.environment}/rds/DATABASE_URL"
  type = "SecureString"
  #   value = "postgresql://${aws_ssm_parameter.username.value}:${aws_ssm_parameter.password.value}@${aws_ssm_parameter.endpoint.value}/auth"
  value = "postgresql://${data.aws_ssm_parameter.username.value}:${data.aws_ssm_parameter.password.value}@${module.harshvardhan-rds.endpoint}/auth"
}