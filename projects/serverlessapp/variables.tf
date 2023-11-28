# Tag Variables
variable "project_name" {
    type = string
}
variable "aws_env" {
    type = string
}
variable "app_name" {
    type = string
}
variable "aws_backup" {
    type = string
}
# S3 Bucket Variables
variable "s3_bucket_name" {
    type = string
}
variable "s3_bucket_names" {
    type = list
}
# ecr repos Variables
variable "ecr_repo_name" {
    type = string    
}
variable "ecr_repo_names" {
    type = list    
}