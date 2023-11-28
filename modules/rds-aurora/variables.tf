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
variable "aws_env" {
    type = string
}
#variable "db_name_list" {
#    type = list
#}
variable "db_final_snapshot_identifier" {
    type = string
    default = "final-snapshot"
}

variable "db_secret_id" {
    type = string
    sensitive = true
}
variable "db_engine" {
    type = string
    default = "aurora-postgresql"
}
variable "db_engine_mode" {
    type = string
    default = "provisioned"
}
variable "db_engine_version" {
    type = string
    default = "14"
}
variable "db_port" {
    type = number
    default = 5432
}
variable "serverlessv2_scaling_configuration" {
    description = "Map of nested attributes with serverless v2 scaling properties. Only valid when `engine_mode` is set to `provisioned`"
    type  = map(string)
    default = {}
}
variable "db_subnet_group_name" {
    type = string
}
variable "db_cluster_parameter_group_name" {
    type = string
}
variable "db_vpc_sg_ids" {
    type = list(string)
}
variable "db_storage_encrypted" {
    type = bool
    default = true
}
variable "db_backup_retention_period" {
    type = number
    default = 7
}
variable "db_skip_final_snapshot" {
    type = bool
    default = true
}
variable "db_copy_tags_to_snapshot" {
    type = bool
    default = true
}
variable "db_allow_major_version_upgrade" {
    type = bool
    default = false
}
variable "db_deletion_protection" {
    type = bool
    default = true
}

variable "db_instance_class" {
    type = string
    default = "db.serverless"
}
variable "db_instance_count" {
    type = number
    default = 1
}
variable "db_parameter_group_name" {
    type = string
    default = "postgres14"
}
variable "db_publicly_accessible" {
    type = bool
    default = false
}
# variable "db_monitoring_interval" {
#     type = number
#     default = 0
# }
variable "db_performance_insights_enabled" {
    type = bool
    default = false
}
variable "db_backup_window" {
    type = string
    default = "02:00-07:00"
}
variable "db_maintenance_window" {
    type = string
    default = "Sun:08:00-Sun:12:00"
}
variable "db_iam_database_authentication_enabled" {
    type = bool
    default = true
}
variable "db_apply_immediately" {
    type = bool
    default = false
}
variable "db_auto_minor_version_upgrade" {
    type = bool
    default = true
}
variable "db_enabled_cloudwatch_logs_exports" {
    type = list(string)
    default = ["postgresql"]
}
variable "db_monitoring_role_arn" {
    type = string
    default = "rds-monitoring-role"
}
variable "db_monitoring_interval" {
    type = number
    default = 60
}
