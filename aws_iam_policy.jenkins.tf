resource "aws_iam_policy" "jenkins" {
  name        = var.jenkins_name
  description = "Allow Management account to STS to other accounts"

  policy = data.aws_iam_policy_document.assume.json
}
