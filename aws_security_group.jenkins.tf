resource "aws_security_group" "jenkins" {
  name        = var.jenkins_name
  description = "Open default ports for jenkins ssh and web 8080"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Jenkins admin port"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.elb[0].id]
  }

  ingress {
    description = "SSH port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_ip]
  }

  egress {
    description = "HTTPS for plugins, SCM, package repos, AWS APIs and SSM"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}
