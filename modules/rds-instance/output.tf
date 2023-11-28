output "db_instance_id" {
  value       = aws_db_instance.db_instance[*].id
  description = "RDS Instance ID"
}

output "db_instance_arn" {
  value       = aws_db_instance.db_instance[*].arn
  description = "RDS Instance ARN"
}

output "db_endpoint" {
  value       = aws_db_instance.db_instance[*].endpoint
  description = "RDS Endpoint"
}

output "db_name" {
  value       = aws_db_instance.db_instance[*].name
  description = "RDS Name"
}

output "db_address" {
  value       = aws_db_instance.db_instance[*].address
  description = "RDS Address"
}

output "db_port" {
  value       = aws_db_instance.db_instance[*].port
  description = "RDS Port"
}

output "db_status" {
  value       = aws_db_instance.db_instance[*].status
  description = "RDS Status"
}

output "db_user_name" {
  value       = aws_db_instance.db_instance[*].username
  description = "RDS Username"
}