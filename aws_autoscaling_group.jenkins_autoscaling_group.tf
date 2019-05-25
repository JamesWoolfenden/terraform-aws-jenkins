resource "aws_autoscaling_group" "jenkins" {
  vpc_zone_identifier  = [var.private_subnets]
  name                 = var.jenkins_name
  min_size             = var.min_size
  max_size             = var.max_size
  force_delete         = true
  launch_configuration = aws_launch_configuration.jenkins.name
  load_balancers       = [aws_elb.jenkins[0].name]

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Backup"
    value               = "Backup"
    propagate_at_launch = true
  }

  tag {
    key                 = "PatchGroup"
    value               = var.patchgroup
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = var.jenkins_name
    propagate_at_launch = true
  }

  tag {
    key                 = var.ssm_tag_name
    value               = var.ssm_tag_value
    propagate_at_launch = true
  }
}
