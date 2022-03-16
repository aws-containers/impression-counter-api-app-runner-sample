data "aws_caller_identity" "current" {}

resource "null_resource" "this" {
  provisioner "local-exec" {
    command     = <<EOT
        cd ..
        docker build -t ${aws_ecr_repository.this.repository_url}:${var.app_docker_tag} . 
        aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com
        docker push ${aws_ecr_repository.this.repository_url}:${var.app_docker_tag}
    EOT
    interpreter = ["/bin/bash", "-c"]
    working_dir = path.module
  }
  depends_on = [aws_ecr_repository.this]
}