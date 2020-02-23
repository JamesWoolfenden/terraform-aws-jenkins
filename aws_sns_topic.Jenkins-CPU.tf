resource "aws_sns_topic" "Jenkins-CPU" {
  name = "${var.jenkins_name}-CPU"
}
