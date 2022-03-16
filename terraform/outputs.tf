output "ecr" {
  value = aws_ecr_repository.this.repository_url
}

output "apprunner" {
  value = aws_apprunner_service.this.service_url
}

output "elasticache" {
  value = aws_elasticache_replication_group.this.primary_endpoint_address
}