output "ec2_sg_id" {
  value       = module.ec2_sg_module.sg_id
  description = "Security Group for Web instance"
}

output "instance_id" {
  value       = module.ec2_module.instance_id
  description = "EC2 Instance ID"
}

output "instance_arn" {
  value       = module.ec2_module.instance_arn
  description = "EC2 Instance ARN"
}

output "instance_pbl_ip" {
  value       = module.ec2_module.instance_pbl_ip
  description = "Public IP address"
}

output "instance_pvt_ip" {
  value       = module.ec2_module.instance_pvt_ip
  description = "Public IP address"
}

output "db_endpoint" {
  value       = module.rds_module.db_endpoint
  description = "RDS Endpoint"
}

output "rds_db_name" {
  value       = module.rds_module.db_name
  description = "RDS DB Name"
}

output "rds_db_status" {
  value       = module.rds_module.db_status
  description = "RDS DB Status"
}

output "sonar_pvt_alb_dns" {
  value       = module.sonar_pvt_alb_module.alb_dns
  description = "SonarQube Private Application Load balancer DNS Name"
}

# aurora cluster/instance outputs
output "aurora_cluster_id" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_id
  description = "Aurora Cluster ID"
}

output "aurora_cluster_arn" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_arn
  description = "Aurora Cluster ARN"
}

output "aurora_cluster_reader_writer_endpoint" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_endpoint
  description = "Aurora Cluster Endpoint"
}
output "aurora_cluster_reader_endpoint" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_reader_endpoint
  description = "Aurora Cluster Reader Endpoint"
}

output "aurora_cluster_identifier" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_identifier
  description = "Aurora Cluster Identifier"
}

output "aurora_cluster_instances_arn" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_instances_arn
  description = "Aurora Cluster Instances ARN"
}

output "aurora_cluster_instances_identifier" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_instances_identifier
  description = "Aurora Cluster Instances Identifier"
}

output "aurora_cluster_instances_id" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_instances_id
  description = "Aurora Cluster Instances ID"
}

output "aurora_cluster_instances_endpoint" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_instances_endpoint
  description = "Aurora Cluster Instances Endpoint"
}

output "aurora_rds_sg_id" {
  value       = module.rds_aurorapostgres_sg_module.sg_id
  description = "Security Group for Aurora RDS instance"
}

output "aurora_cluster_instances_writer" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_instances_writer
  description = "Aurora Cluster Writer Instances"
}

output "aurora_cluster_instances_engine_version_actual" {
  value       = module.rds_aurorapostgres_module.aurora_cluster_instances_engine_version_actual
  description = "Aurora Cluster Instances Actual Engine Version"
}
