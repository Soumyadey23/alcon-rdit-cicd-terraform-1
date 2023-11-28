variable "org_name" {
    type = string
}
variable "team_name" {
    type = string
}
variable "project_name" {
    type = string
}
variable "aws_region" {
  type = string
}
variable "db_name_list" {
    type = list
}
variable "aws_env" {
    type = string
}
variable "db_availability_zone" {
    type = string
    default = "us-east-1a"
}
variable "db_secret_id" {
    type = string
    sensitive = true
}
variable "db_engine" {
    type = string
    default = "postgres"
}
variable "db_engine_version" {
    type = string
    default = "14.2"
}
variable "db_instance_class" {
    type = string
    default = "db.t3.small"
}
variable "db_storage_type" {
    type = string
    default = "gp2"
}
# variable "db_instance_count" {
#     type = number
#     default = 1
# }
variable "db_allocated_storage" {
    type = number
    default = 10
}
variable "db_max_allocated_storage" {
    type = number
    default = 50
}
variable "db_parameter_group_name" {
    type = string
    default = "postgres14"
}
variable "db_subnet_group_name" {
    type = string
}
variable "db_vpc_sg_ids" {
    type = list(string)
}
variable "db_copy_tags_to_snapshot" {
    type = bool
    default = true
}
variable "db_multi_az" {
    type = bool
    default = false
}
# variable "db_monitoring_interval" {
#     type = number
#     default = 60
# }
variable "db_skip_final_snapshot" {
    type = bool
    default = true
}
variable "db_backup_window" {
    type = string
    default = "03:00-00:00"
}
variable "db_maintenance_window" {
    type = string
    default = "Sun:00:00-Sun:03:00"
}
variable "db_backup_retention_period" {
    type = number
    default = 3
}
variable "db_apply_immediately" {
    type = bool
    default = false
}
variable "db_auto_minor_version_upgrade" {
    type = bool
    default = true
}
variable "db_allow_major_version_upgrade" {
    type = bool
    default = false
}
variable "db_delete_automated_backups" {
    type = bool
    default = true
}
variable "db_deletion_protection" {
    type = bool
    default = false
}
variable "db_final_snapshot_identifier" {
    type = string
    default = "final-snapshot"
}
