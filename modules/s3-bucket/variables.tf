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