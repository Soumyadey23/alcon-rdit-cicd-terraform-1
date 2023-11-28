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

# variable "configuration" {
#   description = "The total configuration, List of Objects/Dictionary"
#   default = [{}]
# }
variable "instance_count" {
    type = number
}
variable "ec2_ami" { 
  type = string 
}
variable "ec2_type" {
  type = string
}
# variable "ec2_type2" {
#   type = string
# }
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
# variable "instance_id" {
#     type = string
# }
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
variable "primary_vpc_id" {
  type = string
}
variable "ingress_ec2sg_ports" {
  type = list(number)
}
variable "ingress_sg_cidr" {
  type = list(string)
}
variable "elb_subnet_id" {
  type = list(string)
}
