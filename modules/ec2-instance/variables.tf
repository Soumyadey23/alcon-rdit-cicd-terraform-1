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
variable "instance_count" {
    type = number
}
variable "vpc_sg_ids" {
    type = list(string)
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
variable "aws_region" {
  type = string
}
variable "aws_env" {
    type = string
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
variable "user_data" {
    type = string
    default = null
}
variable "user_data_replace_on_change" {
    type = bool
    default = false
}