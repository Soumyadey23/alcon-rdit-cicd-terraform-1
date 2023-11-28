terraform {
  backend "s3" {}
}

module "ec2_module" {
  source = "../../modules/ec2-instance"
  user_data = file("./scripts/user-data-ebs.sh")
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  ec2_ami = var.ec2_ami
  ec2_type = var.ec2_type
  instance_count = var.instance_count
  ec2_ssh_key = var.ec2_ssh_key
  ec2_subnet_id = var.ec2_subnet_id
  iam_ec2_profile = var.iam_ec2_profile
  root_ebs_delete = var.root_ebs_delete
  extra_ebs_delete = var.extra_ebs_delete
  extra_ebs_name = var.extra_ebs_name
  extra_ebs_encrypt = var.extra_ebs_encrypt
  extra_ebs_size = var.extra_ebs_size
  extra_ebs_type = var.extra_ebs_type
  vpc_sg_ids = [module.ec2_sg_module.sg_id]
}

module "ec2_sg_module" {
  source = "../../modules/security-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  sg_type = "ec2"
  primary_vpc_id = var.primary_vpc_id
  ingress_sg_ports = var.ec2_ingress_sg_ports
  ingress_sg_cidr = var.ingress_sg_cidr
}

module "sonar_pvt_alb_module" {
  source = "../../modules/application-load-balancer"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  accessible = "pvt"
  internal_lb = var.internal_lb
  alb_subnet_id = var.pvt_subnet_id
  vpc_sg_ids = [module.alb_sg_module.sg_id]
}

module "sonar_pvt_alb_tg_module" {
  source = "../../modules/alb-target-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  accessible = "pvt"
  primary_vpc_id = var.primary_vpc_id
  ec2_port = var.sonar_ec2_port
  ec2_protocol = var.sonar_ec2_protocol
  hc_port = var.sonar_ec2_port
  hc_protocol = var.sonar_ec2_protocol
  target_id = module.ec2_module.instance_id[*]
}

module "sonar_pvt_alb_tg_lsnr_module" {
  source = "../../modules/alb-target-group-listener"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  alb_port = var.sonar_lb_port
  alb_protocol = var.sonar_lb_protocol
  alb_arn = module.sonar_pvt_alb_module.alb_arn
  alb_tg_arn = module.sonar_pvt_alb_tg_module.alb_target_group_arn
}

module "alb_sg_module" {
  source = "../../modules/security-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  sg_type = "lb"
  primary_vpc_id = var.primary_vpc_id
  ingress_sg_ports = var.lb_ingress_sg_ports
  ingress_sg_cidr = var.ingress_sg_cidr
}

module "elb_sg_module" {
  source = "../../modules/security-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  sg_type = "elb"
  primary_vpc_id = var.primary_vpc_id
  ingress_sg_ports = var.lb_ingress_sg_ports
  ingress_sg_cidr = var.ingress_sg_cidr
}

module "rds_module" {
  source = "../../modules/rds-instance-env-var"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  db_availability_zone = var.db_availability_zone
  db_username = var.db_username
  db_password = var.db_password
  # db_secret_id = var.db_secret_id
  db_engine = var.db_engine
  db_engine_version = var.db_engine_version
  db_instance_class = var.db_instance_class
  db_storage_type = var.db_storage_type
  # db_instance_count = var.db_instance_count
  db_name_list = var.db_name_suffix
  db_allocated_storage = var.db_allocated_storage
  db_parameter_group_name = var.db_parameter_group_name
  db_subnet_group_name = var.db_subnet_group_name
  db_vpc_sg_ids = [module.rds_sg_module.sg_id]
}

module "rds_sg_module" {
  source = "../../modules/security-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  sg_type = "rds"
  primary_vpc_id = var.primary_vpc_id
  ingress_sg_ports = var.rds_ingress_sg_ports
  ingress_sg_cidr = var.ingress_sg_cidr
}

# RDS Aurora PostgreSQL Serverless v2 Cluster
module "rds_aurorapostgres_module" {
  source = "../../modules/rds-aurora"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  db_secret_id = var.db_secret_id
  
  db_engine = var.auroradb_engine
  db_engine_mode = var.auroradb_engine_mode
  db_engine_version = var.auroradb_engine_version
  db_port = var.auroradb_port
  db_instance_class = var.auroradb_instance_class
  db_instance_count = var.auroradb_instance_count
  serverlessv2_scaling_configuration = {
    min_capacity = var.serverlessv2_scaling_min_capacity
    max_capacity = var.serverlessv2_scaling_max_capacity
  }
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
  db_parameter_group_name = aws_db_parameter_group.db_parameter_group.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.rds_cluster_parameter_group.id
  db_vpc_sg_ids = [module.rds_aurorapostgres_sg_module.sg_id]
  #db_name_list = var.db_name_suffix
  db_backup_retention_period = var.auroradb_backup_retention_period
  db_backup_window = var.auroradb_backup_window
  db_maintenance_window = var.auroradb_maintenance_window
  db_auto_minor_version_upgrade = var.auroradb_auto_minor_version_upgrade
  db_enabled_cloudwatch_logs_exports = var.auroradb_enabled_cloudwatch_logs_exports
  db_monitoring_role_arn = var.auroradb_monitoring_role_name
  db_monitoring_interval = var.auroradb_monitoring_interval
}


resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-subnetgroup-aurorapostgres14"
  subnet_ids = var.subnets_id
  description = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-subnetgroup-aurorapostgres14 for ${var.project_name} Aurora instance param group"
}

resource "aws_db_parameter_group" "db_parameter_group" {
  name        = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-paramgroup-aurorapostgres14"
  family      = "aurora-postgresql14"
  description = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-paramgroup-aurorapostgres14 for ${var.project_name} Aurora instance param group"
}

resource "aws_rds_cluster_parameter_group" "rds_cluster_parameter_group" {
  name        = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-cluster-paramgroup-aurorapostgres14"
  family      = "aurora-postgresql14"
  description = "${var.org_name}-${var.team_name}-${var.project_name}-${var.aws_env}-cluster-paramgroup-aurorapostgres14 for ${var.project_name} Aurora instance param group"
  
  parameter {
    name  = "log_statement"
    value = "all"
  }
  # parameter {
  #   name  = "log_min_duration_statement"
  #   value = 1000
  # }
}

module "rds_aurorapostgres_sg_module" {
  source = "../../modules/security-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  sg_type = "rds-aurora"
  primary_vpc_id = var.primary_vpc_id
  # ingress_sg_ports = var.rds_aurora_ingress_sg_ports
  ingress_sg_ports = ["${var.auroradb_port}"]
  ingress_sg_cidr = var.ingress_sg_cidr
}