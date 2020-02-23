resource "aws_cloudwatch_metric_alarm" "JenkinsCPUMaxout" {
  alarm_name          = "JenkinsCPUMaxout"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  alarm_description   = "CPUUtilization maxing out"
  namespace           = "AWS/EC2"
  period              = "300"
  threshold           = "80"
  statistic           = "Average"
  alarm_actions       = [aws_sns_topic.Jenkins-CPU.arn]

  dimensions = {
    AutoscalingGroupName = aws_autoscaling_group.jenkins.name
  }
}
