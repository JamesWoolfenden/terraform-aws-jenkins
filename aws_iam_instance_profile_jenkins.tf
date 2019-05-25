resource "aws_iam_instance_profile" "jenkins" {
  name = var.jenkins_name
  path = "/"
  role = aws_iam_role.jenkins.name
}
