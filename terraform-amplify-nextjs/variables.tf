# Configuration Variables
variable "environment" {
  description = "Environment for the resources"
  default = "Dev"
}

variable "project_name" {
  description = "Project name"
  default = "Amplify"

}

variable "state_bucket" {
    description = "name of the s3 bucket to store s3 state in"
    default = "amplify101"
}

variable "state_bucket_key" {
    description = "key in state bucket"
    default = "dev"
}

variable "region" {
    description = "AWS region"
    default = "us-east-1"
}

variable "access_key" {
    description = "AWS access key"
}

variable "secret_key" {
    description = "Aws secret access key"
}

variable "github_repository" {
    description = "http link of the github repo"
    default = "https://github.com/Phani9997/react.git"
    }