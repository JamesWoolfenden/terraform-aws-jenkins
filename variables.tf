variable "instance_size" {
  description = "The size type for the jenkins instance"
  type        = string
  default     = "t2.micro"

  validation {
    condition     = can(regex("^[a-z0-9-]+\\.[a-z0-9]+$", var.instance_size))
    error_message = "instance_size must be an EC2 instance type such as t3.medium."
  }
}
variable "jenkins_name" {
  description = "Name of the Jenkins deployment, used for the ASG, ELB, security groups, IAM role and tags"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9-]{0,31}$", var.jenkins_name))
    error_message = "jenkins_name must be 1-32 characters of letters, digits and hyphens, starting with a letter or digit (the ELB name limit)."
  }
}
variable "max_size" {
  description = "Maximum number of instances in the Jenkins autoscaling group"
  default     = 1
  type        = number

  validation {
    condition     = var.max_size >= 0 && floor(var.max_size) == var.max_size
    error_message = "max_size must be a whole number greater than or equal to 0."
  }
}
variable "min_size" {
  description = "Minimum number of instances in the Jenkins autoscaling group"
  default     = 1
  type        = number

  validation {
    condition     = var.min_size >= 0 && floor(var.min_size) == var.min_size
    error_message = "min_size must be a whole number greater than or equal to 0."
  }
}
variable "patchgroup" {
  description = "SSM Patch Manager patch group tag value for the Jenkins instances"
  type        = string

  validation {
    condition     = length(var.patchgroup) > 0 && length(var.patchgroup) <= 256
    error_message = "patchgroup must be 1-256 characters (the AWS tag value limit)."
  }
}
variable "private_subnets" {
  description = "Subnet ID the Jenkins autoscaling group launches instances into"
  type        = string

  validation {
    condition     = can(regex("^subnet-[0-9a-f]{8,17}$", var.private_subnets))
    error_message = "private_subnets must be a subnet ID such as subnet-0123456789abcdef0."
  }
}
variable "ssm_tag_name" {
  description = "Tag key applied to the instances for targeting by SSM"
  type        = string

  validation {
    condition     = length(var.ssm_tag_name) > 0 && length(var.ssm_tag_name) <= 128
    error_message = "ssm_tag_name must be 1-128 characters (the AWS tag key limit)."
  }
}
variable "ssm_tag_value" {
  description = "Tag value applied to the instances for targeting by SSM"
  type        = string

  validation {
    condition     = length(var.ssm_tag_value) > 0 && length(var.ssm_tag_value) <= 256
    error_message = "ssm_tag_value must be 1-256 characters (the AWS tag value limit)."
  }
}
variable "common_tags" {
  description = "Tags applied to all resources that support them"
  type        = map(any)

  validation {
    condition     = length(var.common_tags) <= 50
    error_message = "common_tags can hold at most 50 tags (the AWS per-resource limit)."
  }
}
variable "jenkins_ami_version" {
  description = "Version suffix of the jenkins-master AMI to launch (matched as `jenkins-master-<version>*`)"
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9._-]+$", var.jenkins_ami_version))
    error_message = "jenkins_ami_version must contain only letters, digits, dots, underscores and hyphens."
  }
}
variable "vpc_id" {
  description = "ID of the VPC Jenkins is deployed into"
  type        = string

  validation {
    condition     = can(regex("^vpc-[0-9a-f]{8,17}$", var.vpc_id))
    error_message = "vpc_id must be a VPC ID such as vpc-0123456789abcdef0."
  }
}
variable "encrypted" {
  type        = bool
  default     = true
  description = "For disk volumes"
}
variable "root_device_name" {
  type        = string
  default     = "/dev/xvda"
  description = "Root EBS device name for the launch template"

  validation {
    condition     = can(regex("^/dev/[a-z0-9]+$", var.root_device_name))
    error_message = "root_device_name must be a device path such as /dev/xvda."
  }
}
