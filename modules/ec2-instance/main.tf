resource "aws_instance" "instance" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  count                  = var.instance_count
  key_name               = var.ec2_ssh_key
  iam_instance_profile   = var.iam_ec2_profile
  subnet_id              = var.ec2_subnet_id
  vpc_security_group_ids = var.vpc_sg_ids
  user_data              = var.user_data
  user_data_replace_on_change = var.user_data_replace_on_change
  disable_api_termination = false
  monitoring              = false
  tags = {
    Name        = "${var.org_name}-${var.team_name}-${var.project_name}-ec2instance${count.index + 1}"
  }

  lifecycle {
    ignore_changes = [
      root_block_device["tags"],
      vpc_security_group_ids,
    ]
  }

  root_block_device {
    delete_on_termination = var.root_ebs_delete
    tags = {
      Name        = "${var.org_name}-${var.team_name}-${var.project_name}-rt-ebs${count.index + 1}"
      # Backup      = "Daily"
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
      # Backup      = "Daily"
      # Org         = "${var.org_name}"
      # Team        = "${var.team_name}"
      # Project     = "${var.project_name}"
      # Environment = "${var.aws_env}" 
    }
  }
}
