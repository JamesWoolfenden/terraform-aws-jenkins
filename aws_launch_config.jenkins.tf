resource "aws_launch_configuration" "jenkins" {
  image_id             = data.aws_ami.jenkins.id
  instance_type        = var.instance_size
  key_name             = module.ssh-key.keys
  iam_instance_profile = aws_iam_instance_profile.jenkins.name
  user_data            = data.template_cloudinit_config.jenkins_master_user_data.rendered

  security_groups = [
    aws_security_group.jenkins.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
