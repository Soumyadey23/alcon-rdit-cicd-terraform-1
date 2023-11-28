# provider and general info
aws_region              = "us-east-1"
aws_env                 = "dev"
org_name                = "alcon"
team_name               = "rdit"
project_name            = "sonarqube"

# ec2 instance info
ec2_ami                 = "ami-0cff7528ff583bf9a"
ec2_type                = "t3.medium"
instance_count          = 1
ec2_ssh_key             = "apc-dev-rdit-dhoteyo1"
iam_ec2_profile         = "Default-SSM-Instance-Profile"
ec2_subnet_id           = "subnet-0fc77fd969b4f8898"

# ebs block devices
root_ebs_delete         = true
extra_ebs_delete        = true
extra_ebs_name          = "/dev/sdf"
extra_ebs_encrypt       = true
extra_ebs_size          = 20
extra_ebs_type          = "gp2"
    
# security group info
primary_vpc_id          = "vpc-0a9b54dfe2c339d0e"
ec2_ingress_sg_ports    = [80, 22, 9000]
ingress_sg_cidr         = ["10.0.0.0/8", "136.0.0.0/8", "161.0.0.0/8", "192.168.0.0/16", "128.92.214.160/28", "165.225.216.0/23"]
lb_ingress_sg_ports     = [80, 8080]
rds_ingress_sg_ports    = [5432]

# elastic load balancer info
internal_lb             = true
pvt_subnet_id           = ["subnet-0fc77fd969b4f8898", "subnet-0f283bc1f8455079a"]
pbl_subnet_id           = ["subnet-0310ad0766aec552e", "subnet-07ff8df1803e58bc8"]
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
