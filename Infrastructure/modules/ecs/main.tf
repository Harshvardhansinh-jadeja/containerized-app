resource "aws_ecs_cluster" "gen-cluster" {
  name = var.name
}

resource "aws_ecs_cluster_capacity_providers" "gen_provider" {
  cluster_name       = aws_ecs_cluster.gen-cluster.name
  capacity_providers = ["FARGATE"]
}

locals {
  environment = flatten([for key, value in var.environment :
    [{
      name  = key
      value = value
      }
  ]])
}

locals {
  secret = flatten([for key, value in var.secrets :
    [{
      name      = key
      valueFrom = value
      }
  ]])
}

resource "aws_ecs_task_definition" "gen-task-definition" {
  family       = var.family
  network_mode = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = var.container-name,
      image     = var.image
      essential = true,
      environment : local.environment
      secrets : local.secret
      # environment: var.environment
      portMappings = [
        {
          containerPort = var.container-port
          hostPort      = var.container-port
        }
      ],
      logConfiguration : var.aws_log
    }
  ])

  requires_compatibilities = ["FARGATE"]
  cpu                      = "0.5 vCPU"
  memory                   = "1GB"

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
  execution_role_arn = var.role_arn
  # task_role_arn      = var.role_arn
}

resource "aws_ecs_service" "gen-service" {
  name                = var.service_name
  cluster             = aws_ecs_cluster.gen-cluster.id
  task_definition     = aws_ecs_task_definition.gen-task-definition.arn
  desired_count       = var.desired_count
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"

  load_balancer {
    target_group_arn = var.tg_arn
    container_name   = var.container-name
    container_port   = var.container-port
  }

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
  }

}