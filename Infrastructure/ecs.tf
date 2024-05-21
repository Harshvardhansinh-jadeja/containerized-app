# Module for Creating Cluster, Service and Task Definition
module "harshvardhan-cluster" {
  source         = "./modules/ecs"
  name           = "${var.environment}-cluster"
  family         = "harshvardhan-task-def"
  container-name = var.container-name
  # environment= [{
  #     name = "DATABASE_URL",
  #     value = "postgresql://${var.username}:${var.password}@${module.harshvardhan-rds.endpoint}/auth"
  #     },
  #    {
  #     name = "AUTH_SECRET",
  #     value = "E5rLUtvhWmt00MoXqnX9kgS9Ak8gc7Z88keYaW8mhbU="
  #     },
  #  ]
  # environment = {
  #   "DATABASE_URL" = "postgresql://${var.username}:${var.password}@${module.harshvardhan-rds.endpoint}/auth",
  #   "AUTH_SECRET" = "E5rLUtvhWmt00MoXqnX9kgS9Ak8gc7Z88keYaW8mhbU="
  # }
  secrets = {
    "DATABASE_URL" = "/harshvardhan/sandbox/rds/DATABASE_URL"
    "AUTH_SECRET"  = "/harshvardhan/sandbox/rds/auth_secret"
    # "AUTH_SECRET"  = data.aws_ssm_parameter.auth_secret.arn
  }
  environment = {
    "test" = "1"
  }
  container-port = var.container-port
  image          = local.image
  role_arn       = data.aws_iam_role.task_exec-role.arn
  service_name   = "harshvardhan-service"
  desired_count  = 1
  tg_arn         = module.harshvardhan-tg.tg_arn
  subnets        = [module.harshvardhan-private-sub-1.id, module.harshvardhan-private-sub-2.id]
  aws_log = {
    logDriver : "awslogs",
    options : {
      awslogs-group : "/ecs/harshvardhan-task-def",
      awslogs-region : var.region,
      awslogs-create-group : "true",
      awslogs-stream-prefix : "ecs"
    }
  }
  security_groups = [module.harshvardhan-ecs-sg.sg_id]
}
