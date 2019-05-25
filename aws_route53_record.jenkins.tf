#No DNS for now
resource "aws_route53_record" "jenkins" {
  count   = var.route53_required
  zone_id = var.zoneid
  name    = var.route53
  type    = "A"

  alias {
    evaluate_target_health = false
    name                   = aws_elb.jenkins[0].dns_name
    zone_id                = aws_elb.jenkins[0].zone_id
  }
}
