# provider and general info
aws_region              = "us-east-1"
aws_env                 = "poc"
org_name                = "alcon"
team_name               = "rdit"
project_name            = "rdsbuilding"

# ec2 instance info
ec2_ami                 = "ami-0cff7528ff583bf9a"
ec2_type                = "t3.medium"
instance_count          = 1
ec2_ssh_key             = "sb-rdit-ec2-key"
iam_ec2_profile         = "Default-SSM-Instance-Profile"
ec2_subnet_id           = "subnet-055cd1c01bc3c612a"

# ebs block devices
root_ebs_delete         = true
extra_ebs_delete        = true
extra_ebs_name          = "/dev/sdf"
extra_ebs_encrypt       = true
extra_ebs_size          = 10
extra_ebs_type          = "gp2"

# security group info
primary_vpc_id          = "vpc-0c1a9d01f80bcb9e3"
ec2_ingress_sg_ports    = [80, 22, 9000]
ingress_sg_cidr         = ["10.0.0.0/8", "136.0.0.0/8", "161.0.0.0/8", "192.168.0.0/16", "128.92.214.160/28"]
lb_ingress_sg_ports     = [80, 8080]
rds_ingress_sg_ports    = [5432]

# elastic load balancer info
internal_lb             = false
pvt_subnet_id           = ["subnet-055cd1c01bc3c612a", "subnet-071bc4e6e748bf2e5"]
pbl_subnet_id           = ["subnet-055cd1c01bc3c612a", "subnet-071bc4e6e748bf2e5"]
sonar_ec2_port          = 9000
sonar_ec2_protocol      = "HTTP"
sonar_lb_port           = 80
sonar_lb_protocol       = "HTTP"

# rds info
db_availability_zone    = "us-east-1a"
db_engine               = "postgres"
db_engine_version       = "14.3"
db_instance_class       = "db.t3.small"
db_storage_type         = "gp2"
db_instance_count       = 1
db_allocated_storage    = 10
db_parameter_group_name = "rdit-sonarqube-postgres14"
db_subnet_group_name    = "rdit-sonarqube-db-subnet"
db_username             = "tfdbadmin"
db_password             = "tfdbpassword"
