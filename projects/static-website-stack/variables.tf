variable "aws_region" {
  type = string
}
variable "ec2_ami" { 
  type = string 
}
variable "ec2_type" {
  type = string
}
variable "ec2_ssh_key" {
  type = string
}
variable "primary_vpc_id" {
  type = string
}
variable "ec2_subnet_id" {
  type = string
}
variable "iam_ec2_profile" {
  type = string
}
variable "ingress_ec2sg_ports" {
  type = list(number)
}
variable "ingress_elbsg_ports" {
  type = list(number)
}
variable "ingress_sg_cidr" {
  type = list(string)
}
variable "elb_subnet_id" {
  type = list(string)
}
variable "resource_name" {
  type = string
}
