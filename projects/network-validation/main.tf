terraform {
  backend "s3" {}
}

module "ec2_module" {
  source = "../../modules/ec2-instance"
  user_data = file("./scripts/user-data.sh")
  user_data_replace_on_change = var.user_data_replace_on_change
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  ec2_ami = var.ec2_ami
  ec2_type = var.ec2_type
  instance_count = var.instance_count
  ec2_ssh_key = var.ec2_ssh_key
  ec2_subnet_id = var.ec2_subnet_id
  iam_ec2_profile = var.iam_ec2_profile
  root_ebs_delete = var.root_ebs_delete
  extra_ebs_delete = var.extra_ebs_delete
  extra_ebs_name = var.extra_ebs_name
  extra_ebs_encrypt = var.extra_ebs_encrypt
  extra_ebs_size = var.extra_ebs_size
  extra_ebs_type = var.extra_ebs_type
  vpc_sg_ids = [module.ec2_sg_module.sg_id]
}

module "ec2_sg_module" {
  source = "../../modules/security-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  sg_type = "ec2"
  primary_vpc_id = var.primary_vpc_id
  ingress_sg_ports = var.ec2_ingress_sg_ports
  ingress_sg_cidr = var.ingress_sg_cidr
}

module "pvt_alb_module" {
  source = "../../modules/application-load-balancer"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  accessible = "pvt"
  internal_lb = var.internal_lb
  alb_subnet_id = var.pvt_subnet_id
  vpc_sg_ids = [module.alb_sg_module.sg_id]
}

module "pvt_alb_tg_module" {
  source = "../../modules/alb-target-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  accessible = "pvt"
  primary_vpc_id = var.primary_vpc_id
  ec2_port = var.ec2_port
  ec2_protocol = var.ec2_protocol
  hc_port = var.ec2_port
  hc_protocol = var.ec2_protocol
  target_id = module.ec2_module.instance_id[*]
}

module "pvt_alb_tg_lsnr_module" {
  source = "../../modules/alb-target-group-listener"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  alb_port = var.lb_port
  alb_protocol = var.lb_protocol
  alb_arn = module.pvt_alb_module.alb_arn
  alb_tg_arn = module.pvt_alb_tg_module.alb_target_group_arn
}

module "alb_sg_module" {
  source = "../../modules/security-group"
  org_name = var.org_name
  team_name = var.team_name
  project_name = var.project_name
  aws_region = var.aws_region
  aws_env = var.aws_env
  sg_type = "lb"
  primary_vpc_id = var.primary_vpc_id
  ingress_sg_ports = var.lb_ingress_sg_ports
  ingress_sg_cidr = var.ingress_sg_cidr
}

# module "elb_sg_module" {
#   source = "../../modules/security-group"
#   org_name = var.org_name
#   team_name = var.team_name
#   project_name = var.project_name
#   aws_region = var.aws_region
#   aws_env = var.aws_env
#   sg_type = "elb"
#   primary_vpc_id = var.primary_vpc_id
#   ingress_sg_ports = var.lb_ingress_sg_ports
#   ingress_sg_cidr = var.ingress_sg_cidr
# }
