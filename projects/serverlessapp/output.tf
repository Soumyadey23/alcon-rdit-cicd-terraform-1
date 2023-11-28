# Single S3 Bucket
output "s3_bucket_id" {
  value       = module.s3-bucket.s3_bucket_id
  description = "S3 Bucket ID"
}
output "s3_bucket_arn" {
  value       = module.s3-bucket.s3_bucket_arn
  description = "S3 Bucket ARN"
}

# Multiple S3 Buckets
output "s3_buckets_id" {  
  value       = module.s3-bucket[*].s3_bucket_id
  description = "S3 Bucket ID"
}
output "s3_buckets_arn" {  
  value       = module.s3-bucket[*].s3_bucket_arn
  description = "S3 Bucket ARN"
}

#  ECR Repositories

#output "ecr_repository_urls" {
#  value = "${aws_ecr_repository.images[*].repository_url}"
#  description = "ECR Repositories"
#}
