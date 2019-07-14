module "ssh-key" {
  source      = "jameswoolfenden/ssh-ssm/aws"
  version     = "0.2.9"
  ssmpath     = "/core/${var.jenkins_name}/ssh/"
  key_names   = [var.jenkins_name]
  common_tags = var.common_tags
}
