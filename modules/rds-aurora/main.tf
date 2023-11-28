data "aws_caller_identity" "current" {}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = var.db_secret_id
}

locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier                = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-rds-aurora"
  database_name                     = "${var.project_name}"
  engine                            = var.db_engine
  engine_mode                       = var.db_engine_mode
  engine_version                    = var.db_engine_version
  master_username                   = local.db_creds.username
  master_password                   = local.db_creds.password
  port                              = var.db_port
  dynamic "serverlessv2_scaling_configuration" {
    for_each = length(var.serverlessv2_scaling_configuration) > 0 && var.db_engine_mode == "provisioned" ? [var.serverlessv2_scaling_configuration] : []
    content {
      max_capacity = serverlessv2_scaling_configuration.value.max_capacity
      min_capacity = serverlessv2_scaling_configuration.value.min_capacity
    }
  }
    # count                         = length(var.db_name_list)

  db_subnet_group_name                = var.db_subnet_group_name
  db_cluster_parameter_group_name     = var.db_cluster_parameter_group_name
  db_instance_parameter_group_name    = var.db_allow_major_version_upgrade ? var.db_parameter_group_name : null
  vpc_security_group_ids              = var.db_vpc_sg_ids

  storage_encrypted                   = var.db_storage_encrypted
  preferred_backup_window             = var.db_backup_window
  backup_retention_period             = var.db_backup_retention_period
  preferred_maintenance_window        = var.db_maintenance_window
  skip_final_snapshot                 = var.db_skip_final_snapshot
  copy_tags_to_snapshot               = var.db_copy_tags_to_snapshot
  allow_major_version_upgrade         = var.db_allow_major_version_upgrade
  deletion_protection                 = var.db_deletion_protection
  enabled_cloudwatch_logs_exports     = var.db_enabled_cloudwatch_logs_exports
  iam_database_authentication_enabled = var.db_iam_database_authentication_enabled
  apply_immediately                   = var.db_apply_immediately

  tags = {
    Cluster_Name                = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-rds-aurora"
    Final_Snapshot              = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-rds-aurora-cluster-${var.db_final_snapshot_identifier}"
  }
}


resource "aws_rds_cluster_instance" "aurora_cluster_instances" {
  identifier                    = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-${count.index}"
  cluster_identifier            = aws_rds_cluster.aurora_cluster.id
  instance_class                = var.db_instance_class
  engine                        = aws_rds_cluster.aurora_cluster.engine
  engine_version                = aws_rds_cluster.aurora_cluster.engine_version
  count                         = var.db_instance_count
  #count                         = length(var.db_name_list)

  db_subnet_group_name          = var.db_subnet_group_name
  db_parameter_group_name       = var.db_allow_major_version_upgrade ? null : var.db_parameter_group_name

  preferred_maintenance_window  = var.db_maintenance_window
  publicly_accessible           = var.db_publicly_accessible
  copy_tags_to_snapshot         = var.db_copy_tags_to_snapshot
  monitoring_role_arn           = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.db_monitoring_role_arn}"
  monitoring_interval           = var.db_monitoring_interval
  performance_insights_enabled  = var.db_performance_insights_enabled
  apply_immediately             = var.db_apply_immediately
  auto_minor_version_upgrade    = var.db_auto_minor_version_upgrade
  # lifecycle {
  #   ignore_changes = [auto_minor_version_upgrade]
  # }
  tags = {
    Name                        = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-${count.index}"
    Cluster_Name                = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-rds-aurora"
  }
}
