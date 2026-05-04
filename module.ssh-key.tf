module "ssh-key" {
  source      = "git::https://github.com/jameswoolfenden/terraform-aws-ssh-ssm.git?ref=709c1924e2b16c52df563d94104c04efba87c954"
  ssmpath     = "/core/${var.jenkins_name}/ssh/"
  key_names   = [var.jenkins_name]
  common_tags = var.common_tags
}
