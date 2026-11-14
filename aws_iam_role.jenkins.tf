resource "aws_iam_role" "jenkins" {
  name        = var.jenkins_name
  path        = "/"
  description = "Allows CICD instance to STS to other JIM Accounts"

  assume_role_policy = data.aws_iam_policy_document.trust.json

  max_session_duration = 3600
}
# attaching the AWS managed roles
resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.jenkins.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_role_policy_attachment" "ecr_readonly" {
  role       = aws_iam_role.jenkins.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
resource "aws_iam_role_policy_attachment" "writetocloudwatch" {
  role       = aws_iam_role.jenkins.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
