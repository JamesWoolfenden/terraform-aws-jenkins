# Jenkins

This module creates the Jenkins platform.
Key features of this set-up:

- Support for instance failure
- Support for AZ failure

Noteworthy:
The security groups for the elb must state egress or the ELB wont be fail its health checks.

Issues:
EBS volumes are sticky to an az,
need to regularly create snaphots of ebs volume nightly
could then regularly copy snapshot to the other zone

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| VpcNameTag |  | string | - | yes |
| app_name |  | string | - | yes |
| common_tags |  | map | - | yes |
| env_name |  | string | - | yes |
| environment |  | string | - | yes |
| iam_instance_profile |  | string | - | yes |
| instance_size |  | string | - | yes |
| jenkins_name |  | string | - | yes |
| key_name |  | string | - | yes |
| max_size |  | string | - | yes |
| min_size |  | string | - | yes |
| patchgroup |  | string | - | yes |
| private_subnets |  | string | - | yes |
| private_tag |  | string | - | yes |
| public_subnets |  | string | - | yes |
| route53 |  | string | - | yes |
| sslarn |  | string | - | yes |
| ssm_tag_name |  | string | - | yes |
| ssm_tag_value |  | string | - | yes |
| vpc_id |  | string | - | yes |
| zoneid |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| elb_dns |  |
# terraform-aws-jenkins
