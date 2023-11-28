# provider info
aws_region = "us-east-1"

resource_name = "static-website"

# ec2 instance info
ec2_ami         = "ami-048ff3da02834afdc"
ec2_type        = "t3.nano"
ec2_ssh_key     = "sb-rdit-ec2-key"
iam_ec2_profile = "Default-SSM-Instance-Profile"
ec2_subnet_id   = "subnet-055cd1c01bc3c612a"

# security group info
primary_vpc_id      = "vpc-0c1a9d01f80bcb9e3"
ingress_ec2sg_ports = [80, 22]
ingress_sg_cidr     = ["10.0.0.0/8", "136.0.0.0/8", "161.0.0.0/8", "192.168.0.0/16"]
ingress_elbsg_ports = [80]
elb_subnet_id       = ["subnet-055cd1c01bc3c612a", "subnet-071bc4e6e748bf2e5"]
