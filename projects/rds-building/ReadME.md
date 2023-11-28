module "ec2_module" {
  source            = "../../modules/ec2-instance"
  user_data         = file("./scripts/user-data.sh")
  org_name          = var.org_name
  team_name         = var.team_name
  project_name      = var.project_name
  aws_env           = var.aws_env
  ec2_ami           = var.ec2_ami
  ec2_type          = var.ec2_type
  instance_count    = var.instance_count
  ec2_ssh_key       = var.ec2_ssh_key
  ec2_subnet_id     = var.ec2_subnet_id
  iam_ec2_profile   = var.iam_ec2_profile
  root_ebs_delete   = var.root_ebs_delete
  extra_ebs_delete  = var.extra_ebs_delete
  extra_ebs_name    = var.extra_ebs_name
  extra_ebs_encrypt = var.extra_ebs_encrypt
  extra_ebs_size    = var.extra_ebs_size
  extra_ebs_type    = var.extra_ebs_type
  vpc_sg_ids        = [module.ec2_sg_module.sg_id]
}

module "ec2_sg_module" {
  source            = "../../modules/security-group"
  org_name          = var.org_name
  team_name         = var.team_name
  project_name      = var.project_name
  aws_env           = var.aws_env
  sg_type           = "ec2"
  primary_vpc_id    = var.primary_vpc_id
  ingress_sg_ports  = var.ingress_ec2sg_ports
  ingress_sg_cidr   = var.ingress_sg_cidr
}

module "sonar_pvt_elb_module" {
  source          = "../../modules/load-balancer"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  elb_type        = "pvt"
  instance_count  = var.instance_count
  internal_lb     = "true"
  elb_subnet_id   = var.pvt_subnet_id
  ec2_port        = var.sonar_ec2_port
  ec2_protocol    = var.sonar_ec2_protocol
  elb_port        = var.sonar_elb_port
  elb_protocol    = var.sonar_elb_protocol
  vpc_sg_ids      = [module.elb_sg_module.sg_id]
  instance_ids    = module.ec2_module.instance_id[*]
}

module "sonar_pbl_elb_module" {
  source          = "../../modules/load-balancer"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  elb_type        = "pbl"
  instance_count  = var.instance_count
  internal_lb     = "false"
  elb_subnet_id   = var.pbl_subnet_id
  ec2_port        = var.sonar_ec2_port
  ec2_protocol    = var.sonar_ec2_protocol
  elb_port        = var.sonar_elb_port
  elb_protocol    = var.sonar_elb_protocol
  vpc_sg_ids      = [module.elb_sg_module.sg_id]
  instance_ids    = module.ec2_module.instance_id[*]
}

module "sonar_pvt_alb_module" {
  source          = "../../modules/application-load-balancer"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  accessible      = "pvt"
  internal_lb     = "true"
  elb_subnet_id   = var.pvt_subnet_id
  vpc_sg_ids      = [module.elb_sg_module.sg_id]
}

module "sonar_pbl_alb_module" {
  source          = "../../modules/application-load-balancer"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  accessible      = "pbl"
  internal_lb     = "false"
  elb_subnet_id   = var.pbl_subnet_id
  vpc_sg_ids      = [module.elb_sg_module.sg_id]
}

module "sonar_pvt_alb_tg_module" {
  source          = "../../modules/alb-target-group"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  accessible      = "pvt"
  primary_vpc_id  = var.primary_vpc_id
  ec2_port        = var.sonar_ec2_port
  ec2_protocol    = var.sonar_ec2_protocol
  hc_port         = var.sonar_ec2_port
  hc_protocol     = var.sonar_ec2_protocol
  target_id       = module.ec2_module.instance_id[*]
}

module "sonar_pbl_alb_tg_module" {
  source          = "../../modules/alb-target-group"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  accessible      = "pbl"
  primary_vpc_id  = var.primary_vpc_id
  ec2_port        = var.sonar_ec2_port
  ec2_protocol    = var.sonar_ec2_protocol
  hc_port         = var.sonar_ec2_port
  hc_protocol     = var.sonar_ec2_protocol
  target_id       = module.ec2_module.instance_id[*]
}

module "sonar_pvt_alb_tg_lsnr_module" {
  source          = "../../modules/alb-target-group-listener"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  elb_port        = var.sonar_elb_port
  elb_protocol    = var.sonar_elb_protocol
  alb_arn         = module.sonar_pvt_alb_module.alb_arn
  alb_tg_arn      = module.sonar_pvt_alb_tg_module.alb_target_group_arn
}

module "sonar_pbl_alb_tg_lsnr_module" {
  source          = "../../modules/alb-target-group-listener"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  elb_port        = var.sonar_elb_port
  elb_protocol    = var.sonar_elb_protocol
  alb_arn         = module.sonar_pbl_alb_module.alb_arn
  alb_tg_arn      = module.sonar_pbl_alb_tg_module.alb_target_group_arn
}

module "elb_sg_module" {
  source            = "../../modules/security-group"
  org_name          = var.org_name
  team_name         = var.team_name
  project_name      = var.project_name
  aws_env           = var.aws_env
  sg_type           = "elb"
  primary_vpc_id    = var.primary_vpc_id
  ingress_sg_ports  = var.ingress_elbsg_ports
  ingress_sg_cidr   = var.ingress_sg_cidr
}


output "ec2_sg_id" {
  value       = module.ec2_sg_module.sg_id
  description = "Security Group for Web instance"
}

output "instance_id" {
  value       = module.ec2_module.instance_id
  description = "EC2 Instance ID"
}

output "instance_arn" {
  value       = module.ec2_module.instance_arn
  description = "EC2 Instance ARN"
}

output "instance_pbl_ip" {
  value       = module.ec2_module.instance_pbl_ip
  description = "Public IP address"
}

output "instance_pvt_ip" {
  value       = module.ec2_module.instance_pvt_ip
  description = "Public IP address"
}

output "sonar_pvt_elb_dns" {
  value       = module.sonar_pvt_elb_module.elb_dns
  description = "SonarQube Private Elastic Load balancer DNS Name"
}

output "sonar_pbl_elb_dns" {
  value       = module.sonar_pbl_elb_module.elb_dns
  description = "SonarQube Public Elastic Load balancer DNS Name"
}

output "sonar_pvt_alb_dns" {
  value       = module.sonar_pvt_alb_module.alb_dns
  description = "SonarQube Private Application Load balancer DNS Name"
}

output "sonar_pbl_alb_dns" {
  value       = module.sonar_pbl_alb_module.alb_dns
  description = "SonarQube Public Application Load balancer DNS Name"
}
