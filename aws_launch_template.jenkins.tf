resource "aws_launch_template" "jenkins" {
  iam_instance_profile {
    name = aws_iam_instance_profile.jenkins.name
  }

  image_id      = data.aws_ami.jenkins.id
  instance_type = var.instance_size
  key_name      = module.ssh-key.keys
  name_prefix   = "jenkins"
  user_data     = base64encode(data.template_cloudinit_config.jenkins_master_user_data.rendered)

  # new versions become the default so the ASG picks them up via $Default
  update_default_version = true

  network_interfaces {
    device_index                = 0
    associate_public_ip_address = false
    delete_on_termination       = true
    security_groups             = [aws_security_group.jenkins.id]
  }

  block_device_mappings {
    device_name = var.root_device_name
    ebs {
      encrypted = var.encrypted
    }
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
    # 1 stops containers on the instance from reaching IMDS
    http_put_response_hop_limit = 1
  }

  lifecycle {
    create_before_destroy = true
  }
}
