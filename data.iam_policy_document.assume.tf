data "aws_iam_policy_document" "assume" {

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
