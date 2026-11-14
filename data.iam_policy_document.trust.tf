data "aws_iam_policy_document" "trust" {

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
