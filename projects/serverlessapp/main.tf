terraform {
  # S3 bucket to store Terraform State Files
  backend "s3" {}
}

module "s3-bucket" {
  source = "../../modules/s3-bucket"
  s3_bucket_name = var.s3_bucket_name
  s3_bucket_names = var.s3_bucket_names 
  project_name = var.project_name
  aws_env = var.aws_env
  app_name = var.app_name
  aws_backup = var.aws_backup
}

module "ecr-repos" {
  source = "../../modules/ecr-repos"
  ecr_repo_name = var.ecr_repo_name
  ecr_repo_names = var.ecr_repo_names
  project_name = var.project_name
  aws_env = var.aws_env
  app_name = var.app_name
  aws_backup = var.aws_backup
}