resource "aws_alb" "alb" {
  name                        = "${var.org_name}-${var.team_name}-${var.project_name}-${var.accessible}alb"
  security_groups             = var.vpc_sg_ids
  subnets                     = var.alb_subnet_id
  internal                    = var.internal_lb
  load_balancer_type          = var.alb_type
  enable_deletion_protection  = var.deletion_protection
  idle_timeout                = var.idle_timeout

#  access_logs {
#    bucket  = aws_s3_bucket.lb_logs.bucket
#    prefix  = "test-lb"
#    enabled = true
#  }

  tags = {
    Name        = "${var.org_name}-${var.team_name}-${var.project_name}-alb"
  }
}
