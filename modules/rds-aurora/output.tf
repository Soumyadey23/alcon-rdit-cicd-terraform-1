output "aurora_cluster_id" {
  value       = aws_rds_cluster.aurora_cluster.id
  description = "Aurora Cluster ID"
}

output "aurora_cluster_arn" {
  value       = aws_rds_cluster.aurora_cluster.arn
  description = "Aurora Cluster ARN"
}

output "aurora_cluster_endpoint" {
  value       = aws_rds_cluster.aurora_cluster.endpoint
  description = "Aurora Cluster Endpoint"
}
output "aurora_cluster_reader_endpoint" {
  value       = aws_rds_cluster.aurora_cluster.reader_endpoint
  description = "Aurora Cluster Reader Endpoint"
}

output "aurora_cluster_identifier" {
  value       = aws_rds_cluster.aurora_cluster.cluster_identifier
  description = "Aurora Cluster Identifier"
}

output "aurora_cluster_instances_arn" {
  value       = aws_rds_cluster_instance.aurora_cluster_instances[*].arn
  description = "Aurora Cluster Instances ARN"
}

output "aurora_cluster_instances_identifier" {
  value       = aws_rds_cluster_instance.aurora_cluster_instances[*].identifier
  description = "Aurora Cluster Instances Identifier"
}

output "aurora_cluster_instances_id" {
  value       = aws_rds_cluster_instance.aurora_cluster_instances[*].id
  description = "Aurora Cluster Instances ID"
}

output "aurora_cluster_instances_endpoint" {
  value       = aws_rds_cluster_instance.aurora_cluster_instances[*].endpoint
  description = "Aurora Cluster Instances Endpoint"
}

output "aurora_cluster_instances_writer" {
  value       = aws_rds_cluster_instance.aurora_cluster_instances[*].writer
  description = "Aurora Cluster Writer Instances"
}

output "aurora_cluster_instances_engine_version_actual" {
  value       = aws_rds_cluster_instance.aurora_cluster_instances[*].engine_version_actual
  description = "Aurora Cluster Instances Actual Engine Version"
}
