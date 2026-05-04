data "aws_iam_policy_document" "assume" {
  # checkov:skip=CKV_AWS_356: IAM policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function

  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      var.role_arns
    ]
  }
}
