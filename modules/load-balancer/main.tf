resource "aws_elb" "elb" {
  name            = "${var.org_name}-${var.team_name}-${var.project_name}-${var.elb_type}elb${count.index + 1}"
  security_groups = var.vpc_sg_ids
  subnets         = var.elb_subnet_id
  count           = var.instance_count

  listener {
    instance_port     = var.ec2_port
    instance_protocol = var.ec2_protocol
    lb_port           = var.elb_port
    lb_protocol       = var.elb_protocol
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = var.instance_ids
  internal                    = var.internal_lb
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name        = "${var.org_name}-${var.team_name}-${var.project_name}-${var.elb_type}elb${count.index + 1}"
  }
}
