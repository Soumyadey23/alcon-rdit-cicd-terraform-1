# provider and general info
variable "aws_region" {
  type = string
}
variable "org_name" {
    type = string
}
variable "team_name" {
    type = string
}
variable "project_name" {
    type = string
}
variable "aws_env" {
    type = string
}

# ec2 instance info
variable "ec2_ami" { 
  type = string 
}
variable "ec2_type" {
  type = string
}
variable "instance_count" {
    type = number
}
variable "ec2_ssh_key" {
  type = string
}
variable "ec2_subnet_id" {
  type = string
}
variable "iam_ec2_profile" {
  type = string
}
variable "user_data" {
    type = string
    default = null
}

# ebs block devices
variable "root_ebs_delete" {
    type = bool
}
variable "extra_ebs_delete" {
    type = bool
}
variable "extra_ebs_name" {
    type = string
}
variable "extra_ebs_encrypt" {
    type = bool
}
variable "extra_ebs_size" {
    type = number
}
variable "extra_ebs_type" {
    type = string
}

# security group info
variable "primary_vpc_id" {
  type = string
}
variable "ec2_ingress_sg_ports" {
  type = list(number)
}
variable "lb_ingress_sg_ports" {
  type = list(number)
}
variable "ingress_sg_cidr" {
  type = list(string)
}
variable "rds_ingress_sg_ports" {
  type = list(number)
}

# elastic load balancer info
variable "internal_lb" {
    type = bool
}
variable "pbl_subnet_id" {
  type = list(string)
}
variable "pvt_subnet_id" {
  type = list(string)
}
variable "sonar_ec2_port" {
    type = number
}
variable "sonar_lb_port" {
    type = number
}
variable "sonar_ec2_protocol" {
    type = string
}
variable "sonar_lb_protocol" {
    type = string
}

# rds info
variable "db_availability_zone" {
    type = string
}
# variable "db_secret_id" {
#     type = string
#     sensitive = true
# }
variable "db_engine" {
    type = string
}
variable "db_engine_version" {
    type = string
}
variable "db_instance_class" {
    type = string
}
variable "db_storage_type" {
    type = string
}
# variable "db_instance_count" {
#     type = number
# }
variable "db_allocated_storage" {
    type = number
}
variable "db_parameter_group_name" {
    type = string
}
variable "db_subnet_group_name" {
    type = string
}
variable "db_name_suffix" {
    type = list
}
# RDS Aurora PostgreSQL Serverless v2 Cluster additional variables
variable "auroradb_engine" {
    type = string
}
variable "auroradb_engine_mode" {
    type = string
}
variable "auroradb_engine_version" {
    type = string
}
variable "auroradb_port" {
    type = number
}
variable "auroradb_instance_class" {
    type = string
}
variable "serverlessv2_scaling_max_capacity" {
    type = number
}
variable "serverlessv2_scaling_min_capacity" {
    type = number
}
variable "auroradb_instance_count" {
    type = number
}

# # security group info
# variable "primary_vpc_id" {
#   type = string
# }
# variable "ingress_sg_cidr" {
#   type = list(string)
# }
# variable "rds_ingress_sg_ports" {
#   type = list(number)
# }

# subnets id info
variable "subnets_id" {
    type = list
}


variable "auroradb_backup_retention_period" {
    type = number
    default = 7
}
variable "auroradb_backup_window" {
    type = string
    default = "02:00-07:00"
}
variable "auroradb_maintenance_window" {
    type = string
    default = "Sun:08:00-Sun:12:00"
}
variable "auroradb_auto_minor_version_upgrade" {
    type = bool
    default = true
}
variable "auroradb_enabled_cloudwatch_logs_exports" {
    type = list(string)
    default = ["postgresql"]
}
variable "auroradb_monitoring_role_name" {
    type = string
    default = "rds-monitoring-role"
}
variable "auroradb_monitoring_interval" {
    type = number
    default = 60
}