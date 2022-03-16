# General configuration
name            = "impression-counter-api"

# Provider configuration
provider_region = "us-east-1" # Update the region
aws_profile     = "default" # Update the profile

# VPC Configurations
vpc_id      = "vpc-xxxxxxxxxx" # Update your VPC ID
subnet_list = ["subnet-xxxxxxxx", "subnet-xxxxxxxx"] # Update your subnets

# Review all the default variables in variables.tfvars in 