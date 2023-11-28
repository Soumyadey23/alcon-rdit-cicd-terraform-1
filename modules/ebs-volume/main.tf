resource "aws_ebs_volume" "volume" {
  availability_zone = "us-east-1a"
  size              = 20
  encrypted         = true
  type              = "gp2"
  
  tags = {
    Name        = "${var.org_name}-${var.team_name}-${var.project_name}-ebs"
  }
}

resource "aws_volume_attachment" "volume_attachment" {
  device_name   = "/dev/sdf"
  volume_id     = aws_ebs_volume.volume.id
  instance_id   = var.instance_id
}
