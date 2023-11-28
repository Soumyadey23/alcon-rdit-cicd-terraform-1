resource "aws_security_group" "sg" {
  name   = "${var.org_name}-${var.team_name}-${var.project_name}-${var.sg_type}-sg"
  vpc_id = var.primary_vpc_id
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_sg_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = var.ingress_sg_cidr
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "All"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.org_name}-${var.team_name}-${var.project_name}-${var.sg_type}-sg"
  }
}
