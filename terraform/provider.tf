terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5.0"
    }
  }
}

provider "aws" {
  region                   = var.provider_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.aws_profile
}

# For pressistant S3 backend for terraform state
# terraform {
#   backend "s3" {
#     bucket  = "app-runner-sample"
#     key     = "app-runner"
#     region  = "us-east-1"
#     encrypt = true
#     profile = var.aws_profile
#   }
# }