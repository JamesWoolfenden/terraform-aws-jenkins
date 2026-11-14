# Labels were renamed to snake_case; these keep existing state addresses intact.
moved {
  from = aws_iam_role_policy_attachment.ssm-attach
  to   = aws_iam_role_policy_attachment.ssm_attach
}
moved {
  from = aws_iam_role_policy_attachment.ecr-readonly
  to   = aws_iam_role_policy_attachment.ecr_readonly
}
moved {
  from = aws_iam_role_policy_attachment.sts-to-other-accounts
  to   = aws_iam_role_policy_attachment.sts_to_other_accounts
}
moved {
  from = aws_iam_role_policy_attachment.CloudWatchAgentServerPolicy
  to   = aws_iam_role_policy_attachment.cloudwatch_agent_server_policy
}
