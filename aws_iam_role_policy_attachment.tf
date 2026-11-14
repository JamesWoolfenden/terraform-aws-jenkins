resource "aws_iam_role_policy_attachment" "sts_to_other_accounts" {
  role       = aws_iam_role.jenkins.name
  policy_arn = aws_iam_policy.jenkins.arn
}
resource "aws_iam_role_policy_attachment" "cloudwatch_agent_server_policy" {
  role       = aws_iam_role.jenkins.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}
