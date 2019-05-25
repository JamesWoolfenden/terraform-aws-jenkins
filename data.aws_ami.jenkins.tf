data "aws_ami" "jenkins" {
  most_recent = true

  filter {
    name   = "name"
    values = ["jenkins-master-${var.jenkins_ami_version}*"]
  }

  owners=[data.aws_caller_identity.current.account_id]
}
