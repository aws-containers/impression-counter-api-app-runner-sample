resource "aws_elasticache_subnet_group" "this" {
  name       = var.name
  subnet_ids = var.subnet_list
}

resource "aws_elasticache_replication_group" "this" {
  engine                     = var.engine
  engine_version             = var.engine_version
  node_type                  = var.node_type
  num_cache_clusters         = var.num_cache_nodes
  parameter_group_name       = var.parameter_group_name
  port                       = var.elasticache_port
  automatic_failover_enabled = var.automatic_failover_enabled
  replication_group_id       = var.name
  description                = var.name
  security_group_ids         = [aws_security_group.allow_elasicache.id]
  subnet_group_name          = aws_elasticache_subnet_group.this.name
  user_group_ids             = []

  apply_immediately = var.apply_immediately

  tags = {
    Name = var.name
  }
}