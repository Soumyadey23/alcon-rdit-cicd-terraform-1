variable "elb_subnet_id" {
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
variable "aws_env" {
    type = string
}
variable "vpc_sg_ids" {
    type = list(string)
}
variable "instance_ids" {
    type = list(string)
}
variable "instance_count" {
    type = number
}
variable "ec2_port" {
    type = number
}
variable "elb_port" {
    type = number
}
variable "ec2_protocol" {
    type = string
}
variable "elb_protocol" {
    type = string
}
variable "elb_type" {
    type = string
}
variable "internal_lb" {
    type = string
}
