resource "aws_security_group" "allow_elasicache" {
  name        = "${var.name}-allow-elasticache"
  description = "Allow access to Elasticache from VPC Connector"
  vpc_id      = var.vpc_id

  ingress {
    description = "Access to Elasticache from VPC Connector"
    from_port   = var.elasticache_port
    to_port     = var.elasticache_port
    protocol    = "tcp"
    self        = true
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-allow-elasticache"
  }
}