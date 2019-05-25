resource "aws_security_group" "elb" {
  count       = var.elb_required
  name        = "${var.jenkins_name}-ELB"
  description = "Http"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_ips}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags =var.common_tags
}
