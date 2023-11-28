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
variable "db_instance_count" {
    type = number
}
variable "db_allocated_storage" {
    type = number
}
variable "db_parameter_group_name" {
    type = string
}
variable "db_subnet_group_name" {
    type = string
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}