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

variable "configuration" {
  description = "The total configuration, List of Objects/Dictionary"
  default = [{}]
}

variable "instance_count" {
    type = number
}
variable "ec2_ami" {
    type = string
}
variable "ec2_type" {
    type = string
    default = "t2.micro"
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

variable "vpc_sg_ids" {
    type = list(string)
}
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
