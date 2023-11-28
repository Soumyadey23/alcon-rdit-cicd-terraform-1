# provider info
aws_region = "us-east-1"

resource_name = "static-web"

# ec2 instance info
ec2_ami         = "ami-0e1d30f2c40c4c701"
ec2_type        = "t2.micro"
ec2_ssh_key     = "apc-dev-rdit-dhoteyo1"
iam_ec2_profile = "Default-SSM-Instance-Profile"
ec2_subnet_id   = "subnet-0fc77fd969b4f8898"

# security group info
primary_vpc_id      = "vpc-0a9b54dfe2c339d0e"
ingress_ec2sg_ports = [80, 22]
ingress_sg_cidr     = ["10.0.0.0/8", "136.0.0.0/8", "161.0.0.0/8", "192.168.0.0/16"]
ingress_elbsg_ports = [80]
elb_subnet_id       = ["subnet-0310ad0766aec552e", "subnet-07ff8df1803e58bc8"]
