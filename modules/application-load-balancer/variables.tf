variable "org_name" {
    type = string
}
variable "team_name" {
    type = string
}
variable "project_name" {
    type = string
}
variable "accessible" {
    type = string
}
variable "aws_region" {
  type = string
}
variable "aws_env" {
    type = string
}
variable "vpc_sg_ids" {
    type = list(string)
}
variable "alb_subnet_id" {
    type = list(string)
}
variable "internal_lb" {
    type = bool
    default = true
}
variable "alb_type" {
    type = string
    default = "application"
}
variable "deletion_protection" {
    type = bool
    default = false
}
variable "idle_timeout" {
    type = number
    default = 60
}
