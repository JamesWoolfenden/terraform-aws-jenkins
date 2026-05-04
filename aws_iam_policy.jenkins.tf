resource "aws_iam_policy" "jenkins" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  name        = var.jenkins_name
  description = "Allow Management account to STS to other accounts"

  policy = data.aws_iam_policy_document.assume.json
}
