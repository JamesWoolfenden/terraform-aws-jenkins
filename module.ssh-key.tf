module "ssh-key" {
  source      = "jameswoolfenden/ssh-ssm/aws"
  ssmpath     = "/core/${var.jenkins_name}/ssh/"
  key_names   = [var.jenkins_name]
  common_tags = var.common_tags
}
