# Single S3 Bucket
output "s3_bucket_id" {
  value       = aws_s3_bucket.s3-bucket.id
  description = "S3 Bucket ID"
}
output "s3_bucket_arn" {
  value       = aws_s3_bucket.s3-bucket.arn
  description = "S3 Bucket ARN"
}

# Multiple S3 Buckets
output "s3_buckets_id" {  
  value       = aws_s3_bucket.s3-buckets[*].id
  description = "S3 Bucket ID"
}
output "s3_buckets_arn" {  
  value       = aws_s3_bucket.s3-buckets[*].arn
  description = "S3 Bucket ARN"
}