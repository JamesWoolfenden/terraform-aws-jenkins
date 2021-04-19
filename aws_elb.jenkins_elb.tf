resource "aws_elb" "jenkins" {
  #checkov:skip=CKV_AWS_92: "Ensure the ELB has access logging enabled"
  count = var.elb_required
  name  = var.jenkins_name

  subnets = [
    var.public_subnets
  ]

  listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = var.sslarn
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:8080/login"
    interval            = 30
  }

# tfsec:ignore:AWS005
  internal = var.elb_internal

  security_groups = [
    aws_security_group.elb[0].id,
  ]

  connection_draining = var.elb_connection_draining

  tags = var.common_tags
}
