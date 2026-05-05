resource "aws_security_group" "elb" {
  # checkov:skip=CKV_AWS_382: Unrestricted outbound access required for resource functionality
  # checkov:skip=CKV2_AWS_5: SG is attached to aws_elb.jenkins; count conditional prevents static analysis detection
  count       = var.elb_required
  name        = "${var.jenkins_name}-ELB"
  description = "Http"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_ip]
  }

  egress {
    description = "Allow outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    # tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}
