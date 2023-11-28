output "rds_db_name" {
  value       = module.rds_module.db_name
  description = "RDS DB Name"
}

output "rds_db_status" {
  value       = module.rds_module.db_status
  description = "RDS DB Status"
}
