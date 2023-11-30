# provider and general info
aws_region      = "us-east-1"
aws_env         = "dev"
org_name        = "alcon"
team_name       = "rdit"
project_name    = "tfpoc"
sg_type         = "ingress"

# ec2 instance info
ec2_ami         = "ami-0cff7528ff583bf9a"
ec2_type        = "m5.large"
# ec2_type2       = "t3.micro"
instance_count  = 1
ec2_ssh_key     = "apc-dev-rdit-dhoteyo1"
iam_ec2_profile = "Default-SSM-Instance-Profile"
ec2_subnet_id   = "subnet-0fc77fd969b4f8898"

# ebs block devices
root_ebs_delete     = true
extra_ebs_delete    = true
extra_ebs_name      = "/dev/sdf"
extra_ebs_encrypt   = true
extra_ebs_size      = 20
extra_ebs_type      = "gp2"
    
# security group info
primary_vpc_id      = "vpc-0e6e0e44c1c187780"
ingress_ec2sg_ports = [80, 22]
ingress_sg_cidr     = ["10.0.0.0/8", "136.0.0.0/8", "161.0.0.0/8", "192.168.0.0/16"]
elb_subnet_id       = ["subnet-0310ad0766aec552e", "subnet-07ff8df1803e58bc8"]
