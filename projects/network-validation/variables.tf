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
variable "user_data_replace_on_change" {
    type = bool
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

# elastic load balancer info
variable "internal_lb" {
    type = bool
}
# variable "pbl_subnet_id" {
#   type = list(string)
# }
variable "pvt_subnet_id" {
  type = list(string)
}
variable "ec2_port" {
    type = number
}
variable "lb_port" {
    type = number
}
variable "ec2_protocol" {
    type = string
}
variable "lb_protocol" {
    type = string
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
# variable "subnets_id" {
#     type = list
# }
