# AWS Provider
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

# Terraform Settings
terraform {
  backend "s3" {
    bucket = "phani997"
    key    = "phani"
    region = "us-east-1"
  }
}

module "frontend" {
  source = "./modules/frontend"
  environment  = var.environment
  project_name = var.project_name
  github_repository = var.github_repository
  # github_token_for_ = local.git_hub_token
}