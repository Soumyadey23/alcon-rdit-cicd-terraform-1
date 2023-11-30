module "ec2_module" {
  source            = "../../modules/ec2-instance"
  user_data         = file("./scripts/user-data.sh")
  org_name          = var.org_name
  team_name         = var.team_name
  project_name      = var.project_name
  aws_env           = var.aws_env
  aws_region        = var.aws_region
  # configuration     = var.configuration
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

# module "ec2_module2" {
#   source            = "../../modules/ec2-instance"
#   user_data         = file("./scripts/user-data.sh")
#   org_name          = var.org_name
#   team_name         = var.team_name
#   project_name      = var.project_name
#   aws_env           = var.aws_env
#   ec2_ami           = var.ec2_ami
#   ec2_type          = var.ec2_type2
#   instance_count    = var.instance_count
#   ec2_ssh_key       = var.ec2_ssh_key
#   ec2_subnet_id     = var.ec2_subnet_id
#   iam_ec2_profile   = var.iam_ec2_profile
#   root_ebs_delete   = var.root_ebs_delete
#   extra_ebs_delete  = var.extra_ebs_delete
#   extra_ebs_name    = var.extra_ebs_name
#   extra_ebs_encrypt = var.extra_ebs_encrypt
#   extra_ebs_size    = var.extra_ebs_size
#   extra_ebs_type    = var.extra_ebs_type
#   vpc_sg_ids        = [module.ec2_sg_module.sg_id]
# }

module "ec2_sg_module" {
  source          = "../../modules/security-group"
  org_name        = var.org_name
  team_name       = var.team_name
  project_name    = var.project_name
  aws_env         = var.aws_env
  aws_region      = var.aws_region
  sg_type         = var.sg_type
  primary_vpc_id   = var.primary_vpc_id
  ingress_sg_ports = var.ingress_ec2sg_ports
  ingress_sg_cidr  = var.ingress_sg_cidr
}
