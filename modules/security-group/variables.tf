variable "primary_vpc_id" {
    type = string
}
variable "ingress_sg_ports" {
    type = list(number)
}
variable "ingress_sg_cidr" {
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
variable "sg_type" {
    type = string
}
