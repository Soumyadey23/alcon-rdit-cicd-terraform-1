module "pro1_ec2" {
  source          = "../../modules/ec2-instance"
  stack_name      = "pro1-${var.resource_name}-ec2"
  ec2_ami         = var.ec2_ami
  ec2_type        = var.ec2_type
  ec2_ssh_key     = var.ec2_ssh_key
  ec2_subnet_id   = var.ec2_subnet_id
  iam_ec2_profile = var.iam_ec2_profile
  vpc_sg_ids      = [module.pro1_ec2_sg.sg_id]
}

module "pro1_ec2_sg" {
  source           = "../../modules/security-group"
  stack_name       = "pro1-${var.resource_name}-ec2"
  primary_vpc_id   = var.primary_vpc_id
  ingress_sg_ports = var.ingress_ec2sg_ports
  ingress_sg_cidr  = var.ingress_sg_cidr
}
