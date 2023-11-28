# provider and general info
aws_region              = "us-east-1"
aws_env                 = "poc"
org_name                = "alcon"
team_name               = "rdit"
project_name            = "ntwrk-vldtn"

# ec2 instance info
ec2_ami                 = "ami-048ff3da02834afdc"
ec2_type                = "t3.nano"
instance_count          = 1
ec2_ssh_key             = "sb-rdit-ec2-key"
iam_ec2_profile         = "Default-SSM-Instance-Profile"
ec2_subnet_id           = "subnet-055cd1c01bc3c612a"
user_data_replace_on_change = true

# ebs block devices
root_ebs_delete         = true
extra_ebs_delete        = true
extra_ebs_name          = "/dev/sdf"
extra_ebs_encrypt       = true
extra_ebs_size          = 10
extra_ebs_type          = "gp2"
    
# security group info
primary_vpc_id          = "vpc-0c1a9d01f80bcb9e3"
ec2_ingress_sg_ports    = [80, 22]
ingress_sg_cidr         = ["10.0.0.0/8", "136.0.0.0/8", "161.0.0.0/8", "192.168.0.0/16", "128.92.214.160/28", "165.225.216.0/23"]
lb_ingress_sg_ports     = [80]

# elastic load balancer info
internal_lb             = false
pvt_subnet_id           = ["subnet-055cd1c01bc3c612a", "subnet-071bc4e6e748bf2e5"]
# pbl_subnet_id           = ["subnet-055cd1c01bc3c612a", "subnet-071bc4e6e748bf2e5"]
ec2_port                = 80
ec2_protocol            = "HTTP"
lb_port                 = 80
lb_protocol             = "HTTP"
