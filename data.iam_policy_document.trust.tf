data "aws_iam_policy_document" "trust" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function

  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"
      identifiers = [
        "s3.amazonaws.com",
        "ec2.amazonaws.com",
        "ssm.amazonaws.com"
      ]
    }

    #"arn:aws:iam::10000000:root" from another aws account
    principals {
      type        = "AWS"
      identifiers = [var.trusted_role_arns]
    }
  }
}
