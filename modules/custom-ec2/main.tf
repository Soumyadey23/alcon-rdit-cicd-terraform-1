locals {
  serverconfig = [
    for srv in var.configuration : [
      for i in range(1, srv.no_of_instances+1) : {
        ec2_type = srv.ec2_type
        ec2_subnet_id   = srv.ec2_subnet_id
        ec2_ami = srv.ec2_ami
        instance_count = srv.instance_count
        ec2_ssh_key = srv.ec2_ssh_key
        iam_ec2_profile = srv.iam_ec2_profile
      }
    ]
  ]
}

locals {
  instances = flatten(local.serverconfig)
}

resource "aws_instance" "instance" {

  for_each = {for server in local.instances: server.instance_name =>  server}

  ami                    = each.value.ec2_ami
  instance_type          = each.value.ec2_type
  count                  = each.value.instance_count
  key_name               = each.value.ec2_ssh_key
  iam_instance_profile   = each.value.iam_ec2_profile
  subnet_id              = each.value.ec2_subnet_id
  vpc_security_group_ids = var.vpc_sg_ids
  user_data              = var.user_data
  disable_api_termination = false
  monitoring              = false
  tags = {
    Name        = "${var.org_name}-${var.team_name}-${var.project_name}-ec2instance${count.index + 1}"
  }

  root_block_device {
    delete_on_termination = var.root_ebs_delete
    tags = {
      Name        = "${var.org_name}-${var.team_name}-${var.project_name}-root-ebs${count.index + 1}"
      # Org         = "${var.org_name}"
      # Team        = "${var.team_name}"
      # Project     = "${var.project_name}"
      # Environment = "${var.aws_env}"
    }
  }

  ebs_block_device {
    delete_on_termination = var.extra_ebs_delete
    device_name           = var.extra_ebs_name
    encrypted             = var.extra_ebs_encrypt
    volume_size           = var.extra_ebs_size
    volume_type           = var.extra_ebs_type
    tags = {
      Name        = "${var.org_name}-${var.team_name}-${var.project_name}-ebs${count.index + 1}"
      # Org         = "${var.org_name}"
      # Team        = "${var.team_name}"
      # Project     = "${var.project_name}"
      # Environment = "${var.aws_env}"
    }
  }
}
