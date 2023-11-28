resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn   = var.alb_arn 
  port                = var.alb_port
  protocol            = var.alb_protocol
#  ssl_policy          = "ELBSecurityPolicy-2016-08"
#  certificate_arn     = "arn:aws:iam::187416307283:server-certificate/test_cert"

  default_action {
    type             = "forward"
    target_group_arn = var.alb_tg_arn
  }

  tags = {
    Name        = "${var.org_name}-${var.team_name}-${var.project_name}-alb-tg-listener"
  }
}
