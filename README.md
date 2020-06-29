# Terraform-aws-Jenkins

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

This module creates the Jenkins platform.
Key features of this set-up:

- Support for instance failure
- Support for AZ failure

I don't thinks there's a good reason for either of these features,  it's not clear what the intention was with the roles. AWS has moved on and if you have to use Jenkins
then I'd just make it disposable or just snapshot the disk. This was a requirement that in reality would never be needed, giving an SLA in above of the live servers.
The AMi is found via a data-source, which allows you to version your AMI's.

Noteworthy:
The security groups for the elb must state egress or the ELB will fail it's health checks.

Issues:
EBS volumes are sticky to an az, need to regularly create snapshots of ebs volume nightly
could then regularly copy snapshot to the other zone
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Error: no lines in file
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
