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
variable "accessible" {
    type = string
}
variable "primary_vpc_id" {
    type = string
}
variable "target_type" {
    type = string
    default = "instance"
}
variable "ec2_port" {
    type = number
}
variable "ec2_protocol" {
    type = string
}
variable "stickiness_type" {
    type = string
    default = "lb_cookie"
}
variable "hc_enable" {
    type = bool
    default = true
}
variable "hc_healthy_threshold" {
    type = number
    default = 2
}
variable "hc_unhealthy_threshold" {
    type = number
    default = 3
}
variable "hc_timeout" {
    type = number
    default = 10
}
variable "hc_path" {
    type = string
    default = "/"
}
variable "hc_port" {
    type = number
    default = 80
}
variable "hc_protocol" {
    type = string
    default = "HTTP"
}
variable "hc_interval" {
    type = number
    default = 15
}
# variable "target_id" {
#     type = string
# }
variable "target_id" {
    type = list(string)
}