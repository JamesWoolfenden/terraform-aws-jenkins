resource "aws_launch_template" "jenkins" {
  iam_instance_profile {
    name = aws_iam_instance_profile.jenkins.name
  }

  image_id      = data.aws_ami.jenkins.id
  instance_type = var.instance_size
  key_name      = module.ssh-key.keys
  name_prefix   = "jenkins"
  user_data     = base64encode(data.template_cloudinit_config.jenkins_master_user_data.rendered)

  vpc_security_group_ids = [aws_security_group.jenkins.id]

  block_device_mappings {
    device_name = var.root_device_name
    ebs {
      encrypted = var.encrypted
    }
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  lifecycle {
    create_before_destroy = true
  }
}
