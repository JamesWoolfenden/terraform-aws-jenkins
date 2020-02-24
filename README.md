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

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| common\_tags | n/a | `map` | n/a | yes |
| elb\_connection\_draining | n/a | `bool` | `false` | no |
| elb\_internal | n/a | `bool` | `false` | no |
| elb\_required | n/a | `number` | `0` | no |
| instance\_size | The size type for the jenkins instance | `string` | `"t2.micro"` | no |
| jenkins\_ami\_version | n/a | `string` | n/a | yes |
| jenkins\_name | n/a | `string` | n/a | yes |
| max\_size | n/a | `number` | `1` | no |
| min\_size | n/a | `number` | `1` | no |
| patchgroup | n/a | `string` | n/a | yes |
| private\_subnets | n/a | `string` | n/a | yes |
| public\_subnets | n/a | `string` | n/a | yes |
| role\_arns | n/a | `string` | `""` | no |
| route53 | n/a | `string` | `""` | no |
| route53\_required | n/a | `number` | `0` | no |
| ssh\_allowed\_ip | Ssh Allowed IP | `string` | n/a | yes |
| sslarn | n/a | `string` | `""` | no |
| ssm\_tag\_name | n/a | `string` | n/a | yes |
| ssm\_tag\_value | n/a | `string` | n/a | yes |
| trusted\_role\_arns | n/a | `string` | `""` | no |
| vpc\_id | n/a | `string` | n/a | yes |
| zoneid | Route53 Zone | `string` | `""` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
