terraform {
  backend "s3" {}
}

module "rds_module" {
  source = "../../modules/rds-instance-env-var"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  db_availability_zone = var.db_availability_zone
  # db_username = "dbadmin"
  # db_password = "dbpassword"
  db_engine = var.db_engine
  db_engine_version = var.db_engine_version
  db_instance_class = var.db_instance_class
  db_storage_type = var.db_storage_type
  db_instance_count = var.db_instance_count
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
  sg_type = "rds-env-var"
  primary_vpc_id = var.primary_vpc_id
  ingress_sg_ports = var.rds_ingress_sg_ports
  ingress_sg_cidr = var.ingress_sg_cidr
}   