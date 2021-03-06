# terraform-aws-jenkins

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-Jenkins/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-Jenkins)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-Jenkins.svg)](https://github.com/JamesWoolfenden/terraform-aws-Jenkins/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-jenkins.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-jenkins/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-jenkins/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-jenkins&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-jenkins/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-jenkins&benchmark=INFRASTRUCTURE+SECURITY)

---

This module creates the Jenkins platform.
Key features of this set-up:

- Support for instance failure
- Support for AZ failure

I don't thinks there's a good reason for either of these features, it's not clear what the intention was with the roles. AWS has moved on and if you have to use Jenkins
then I'd just make it disposable or just snapshot the disk. This was a requirement that in reality would never be needed, giving an SLA in above of the live servers.
The AMi is found via a data-source, which allows you to version your AMI's.

Noteworthy:
The security groups for the elb must state egress or the ELB will fail it's health checks.

Issues:
EBS volumes are sticky to an az, need to regularly create snapshots of ebs volume nightly
could then regularly copy snapshot to the other zone

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| ssh-key | jameswoolfenden/ssh-ssm/aws | 0.2.9 |

## Resources

| Name |
|------|
| [aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) |
| [aws_autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) |
| [aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) |
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb) |
| [aws_iam_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) |
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) |
| [aws_launch_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) |
| [template_cloudinit_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) |
| [template_file](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | n/a | `map(any)` | n/a | yes |
| elb\_connection\_draining | n/a | `bool` | `false` | no |
| elb\_internal | n/a | `bool` | `false` | no |
| elb\_required | n/a | `number` | `0` | no |
| encrypted | For disk volumes | `bool` | `true` | no |
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

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-jenkins/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-jenkins/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-jenkins&url=https://github.com/JamesWoolfenden/terraform-aws-jenkins
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-jenkins&url=https://github.com/JamesWoolfenden/terraform-aws-jenkins
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-jenkins
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-jenkins
[share_email]: mailto:?subject=terraform-aws-jenkins&body=https://github.com/JamesWoolfenden/terraform-aws-jenkins
