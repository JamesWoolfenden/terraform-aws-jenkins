resource "aws_security_group" "elb" {
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
    description = "Forward to Jenkins on its web port within the VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.jenkins.cidr_block]
  }

  tags = var.common_tags
}
