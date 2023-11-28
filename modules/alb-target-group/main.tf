resource "aws_alb_target_group" "alb_target_group" {
  name                = "${var.team_name}-${var.project_name}-${var.accessible}alb-tg"
  vpc_id              = var.primary_vpc_id
  target_type         = var.target_type
  port                = var.ec2_port
  protocol            = var.ec2_protocol

#  access_logs {
#    bucket  = aws_s3_bucket.lb_logs.bucket
#    prefix  = "test-lb"
#    enabled = true
#  }

  stickiness {
    type = var.stickiness_type
  }

  health_check {
    enabled             = var.hc_enable
    healthy_threshold   = var.hc_healthy_threshold
    unhealthy_threshold = var.hc_unhealthy_threshold
    timeout             = var.hc_timeout
    path                = var.hc_path
    port                = var.hc_port
    protocol            = var.hc_protocol
    interval            = var.hc_interval
  }

  tags = {
    Name        = "${var.org_name}-${var.team_name}-${var.project_name}-${var.accessible}alb-tg"
  }
}

resource "aws_alb_target_group_attachment" "alb_target_group_attachment" {
  count             = length(var.target_id)
  target_id         = var.target_id[count.index]
  # for_each          = toset(var.target_id[*])
  # target_id         = each.key
  target_group_arn  = aws_alb_target_group.alb_target_group.arn
  port              = var.ec2_port
}
