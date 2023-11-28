data "aws_secretsmanager_secret_version" "creds" {
  secret_id = var.db_secret_id
}

locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

resource "aws_db_instance" "db_instance" {
  availability_zone           = var.db_availability_zone
  identifier                  = "${var.org_name}-${var.team_name}-${var.project_name}-rds-${var.db_name_list[count.index]}"
  db_name                     = "${var.project_name}_pg_db_${var.db_name_list[count.index]}"
  username                    = local.db_creds.username
  password                    = local.db_creds.password
  engine                      = var.db_engine
  engine_version              = var.db_engine_version
  instance_class              = var.db_instance_class
  storage_type                = var.db_storage_type
  count                       = length(var.db_name_list)
  # count                       = var.db_instance_count
  # iops                        = "100"
  allocated_storage           = var.db_allocated_storage
  max_allocated_storage       = var.db_max_allocated_storage
  parameter_group_name        = var.db_parameter_group_name
  db_subnet_group_name        = var.db_subnet_group_name
  vpc_security_group_ids      = var.db_vpc_sg_ids
  copy_tags_to_snapshot       = var.db_copy_tags_to_snapshot
  multi_az                    = var.db_multi_az
  # monitoring_interval         = var.db_monitoring_interval
  skip_final_snapshot         = var.db_skip_final_snapshot
  backup_window               = var.db_backup_window
  maintenance_window          = var.db_maintenance_window
  backup_retention_period     = var.db_backup_retention_period
  apply_immediately           = var.db_apply_immediately
  auto_minor_version_upgrade  = var.db_auto_minor_version_upgrade
  allow_major_version_upgrade = var.db_allow_major_version_upgrade
  delete_automated_backups    = var.db_delete_automated_backups
  deletion_protection         = var.db_deletion_protection
  final_snapshot_identifier   = "${var.org_name}-${var.team_name}-${var.project_name}-${var.db_name_list[count.index]}-${var.db_final_snapshot_identifier}"
  tags = {
    Name                      = "${var.org_name}-${var.team_name}-${var.project_name}-rds-${var.db_name_list[count.index]}"
    Final_Snapshot            = "${var.org_name}-${var.team_name}-${var.project_name}-${var.db_name_list[count.index]}-${var.db_final_snapshot_identifier}"
  }
}
