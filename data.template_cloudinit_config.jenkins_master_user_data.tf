data "template_cloudinit_config" "jenkins_master_user_data" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/scripts/cloud-config.tpl", {
      hostname = var.jenkins_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/restore-jenkins.tpl", {
      jenkins_name = var.jenkins_name
      accountno    = data.aws_caller_identity.current.account_id
    })
  }
}
