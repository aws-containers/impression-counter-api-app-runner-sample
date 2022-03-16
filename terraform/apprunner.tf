resource "aws_apprunner_vpc_connector" "this" {
  vpc_connector_name = var.name
  subnets            = var.subnet_list
  security_groups    = [aws_security_group.allow_elasicache.id]
}

resource "aws_apprunner_auto_scaling_configuration_version" "this" {
  auto_scaling_configuration_name = var.name

  max_concurrency = var.max_concurrency
  max_size        = var.max_size
  min_size        = var.min_size

  tags = {
    Name = var.name
  }
}

resource "aws_apprunner_service" "this" {
  service_name = var.name

  source_configuration {
    auto_deployments_enabled = var.auto_deployments_enabled
    authentication_configuration {
      access_role_arn = aws_iam_role.this.arn
    }
    image_repository {
      image_configuration {
        port = var.app_port
        runtime_environment_variables = {
          "REDIS_HOST" : aws_elasticache_replication_group.this.primary_endpoint_address
          "REDIS_PORT" : var.elasticache_port
        }
      }
      image_identifier      = "${aws_ecr_repository.this.repository_url}:${var.app_docker_tag}"
      image_repository_type = var.image_repository_type
    }
  }

  instance_configuration {
    cpu    = var.cpu
    memory = var.memory
  }

  health_check_configuration {
    healthy_threshold   = var.healthy_threshold
    interval            = var.healthcheck_interval
    path                = var.healthcheck_path
    protocol            = var.healthcheck_protocol
    timeout             = var.healthcheck_timeout
    unhealthy_threshold = var.unhealthy_threshold
  }

  network_configuration {
    egress_configuration {
      egress_type       = "VPC"
      vpc_connector_arn = aws_apprunner_vpc_connector.this.arn
    }
  }

  depends_on = [
    aws_elasticache_replication_group.this,
    null_resource.this
  ]
}