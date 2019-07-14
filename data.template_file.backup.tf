data "template_file" "backup" {
  template = file("${path.module}/scripts/restore-jenkins.tpl")

  vars = {
    jenkins_name = var.jenkins_name
    accountno    = data.aws_caller_identity.current.account_id
  }
}

data "template_file" "cloud_init" {
  template = file("${path.module}/scripts/cloud-config.tpl")

  vars = {
    hostname = var.jenkins_name
  }
}

data "template_cloudinit_config" "jenkins_master_user_data" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_init.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.backup.rendered
  }
}
