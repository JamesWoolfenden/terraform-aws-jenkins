module "ssh-key" {
  source      = "git::https://github.com/jameswoolfenden/terraform-aws-ssh-ssm.git?ref=d23adb4769e0b9ec3d42f1b456303b532440497f" #v0.2.46
  ssmpath     = "/core/${var.jenkins_name}/ssh/"
  key_names   = [var.jenkins_name]
  common_tags = var.common_tags
}
