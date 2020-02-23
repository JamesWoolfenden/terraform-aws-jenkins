module "jenkins" {
  source              = "../../"
  ssh_allowed_ip      = local.ip
  common_tags         = var.common_tags
  jenkins_name        = var.jenkins_name
  patchgroup          = var.patchgroup
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets
  ssm_tag_name        = "Usage"
  ssm_tag_value       = "Development"
  jenkins_ami_version = 1
  vpc_id              = "vpc-510efa34"
}
