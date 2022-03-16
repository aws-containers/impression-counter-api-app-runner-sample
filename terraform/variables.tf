# General
variable "name" {
  type        = string
  description = "Project name"
}

# Provider
variable "provider_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_region" {
  type        = string
  description = "(optional) describe your variable"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "aws profile name"
  default     = "default"
}

# ECR
variable "image_tag_mutability" {
  type        = string
  description = "IMMUTABLE|MUTABLE"
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  type    = bool
  default = true
}

variable "encryption_type" {
  type    = string
  default = "KMS"
}

# VPC information
variable "vpc_id" {
  type = string
}

variable "subnet_list" {
  type        = list(string)
  description = "Your VPC subnet list"
}

# Elasticache
variable "elasticache_port" {
  type        = number
  description = "Elasticache Redis Port"
  default     = 6379
}

variable "engine" {
  type    = string
  default = "redis"
}

variable "node_type" {
  type    = string
  default = "cache.t4g.micro"
}

variable "num_cache_nodes" {
  type    = number
  default = 1
}

variable "engine_version" {
  type    = string
  default = "6.x"
}

variable "parameter_group_name" {
  type    = string
  default = "default.redis6.x"
}

variable "automatic_failover_enabled" {
  type    = string
  default = false
}

variable "apply_immediately" {
  type    = bool
  default = true
}

# App Runner
variable "max_concurrency" {
  type        = number
  description = "Max cuncurrent request to trigger scale up"
  default     = 30
}

variable "max_size" {
  type        = number
  description = "The max number of App Runner tasks"
  default     = 10
}

variable "min_size" {
  type        = number
  description = "The max number of App Runner tasks"
  default     = 1
}

variable "app_port" {
  type        = string
  description = "App port"
  default     = "8080"
}

variable "app_docker_tag" {
  type        = string
  description = "Docker image tag"
  default     = "latest"
}

variable "image_repository_type" {
  type        = string
  description = "ECR|ECR_PUBLIC"
  default     = "ECR"
}

variable "healthy_threshold" {
  type    = number
  default = 2
}

variable "healthcheck_interval" {
  type    = number
  default = 10
}

variable "healthcheck_path" {
  type    = string
  default = "/ping"
}

variable "healthcheck_protocol" {
  type        = string
  description = "TCP|HTTP"
  default     = "HTTP"
}

variable "healthcheck_timeout" {
  type    = number
  default = 2
}

variable "unhealthy_threshold" {
  type    = number
  default = 1
}

variable "cpu" {
  type    = string
  default = "1 vCPU"
}

variable "memory" {
  type    = string
  default = "2 GB"
}

variable "auto_deployments_enabled" {
  type    = bool
  default = false
}