# provider and general info
aws_region      = "us-east-1"
aws_env         = "poc"
org_name        = "alcon"
team_name       = "rdit"
project_name    = "tfpoc"

# ec2 instance info
# ec2_ami         = "ami-0c02fb55956c7d316"
# ec2_type        = "t2.micro"
# ec2_type2       = "t3.micro"
# instance_count  = 3
# ec2_ssh_key     = "sb-rdit-ec2-key"
# iam_ec2_profile = "Default-SSM-Instance-Profile"
# ec2_subnet_id   = "subnet-055cd1c01bc3c612a"

configuration = [
    {
        # "application_name" : "GritfyApp-dev",
        "ec2_ami" : "ami-0c02fb55956c7d316",
        "instance_count" : "2",
        "ec2_type" : "t2.micro",
        "ec2_subnet_id" : "subnet-055cd1c01bc3c612a",
        # "vpc_security_group_ids" : ["sg-0d15a4cac0567478c","sg-0d8749c35f7439f3e"]
        "ec2_ssh_key"   : "sb-rdit-ec2-key",
        "iam_ec2_profile" : "Default-SSM-Instance-Profile"
    },
    {
        "ec2_ami" : "ami-0c02fb55956c7d316",
        "no_of_instances" : "1",
        "ec2_type" : "t3.medium",
        "ec2_subnet_id" : "subnet-055cd1c01bc3c612a",
        "ec2_ssh_key"   : "sb-rdit-ec2-key",
        "iam_ec2_profile" : "Default-SSM-Instance-Profile"
    }
]

# ebs block devices
root_ebs_delete     = true
extra_ebs_delete    = true
extra_ebs_name      = "/dev/sdf"
extra_ebs_encrypt   = true
extra_ebs_size      = 20
extra_ebs_type      = "gp2"
    
# security group info
primary_vpc_id      = "vpc-0c1a9d01f80bcb9e3"
ingress_ec2sg_ports = [80, 22]
ingress_sg_cidr     = ["10.0.0.0/8", "136.0.0.0/8", "161.0.0.0/8", "192.168.0.0/16", "128.92.214.163/32"]
elb_subnet_id       = ["subnet-055cd1c01bc3c612a", "subnet-071bc4e6e748bf2e5"]
