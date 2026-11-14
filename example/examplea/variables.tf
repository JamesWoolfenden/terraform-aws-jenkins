variable "jenkins_name" {
  description = "Name of the Jenkins deployment, used for resource names and tags"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9-]{0,31}$", var.jenkins_name))
    error_message = "jenkins_name must be 1-32 characters of letters, digits and hyphens, starting with a letter or digit."
  }
}
variable "patchgroup" {
  description = "SSM Patch Manager patch group tag value for the Jenkins instance"
  type        = string

  validation {
    condition     = length(var.patchgroup) > 0 && length(var.patchgroup) <= 256
    error_message = "patchgroup must be 1-256 characters (the AWS tag value limit)."
  }
}
variable "private_subnets" {
  description = "Subnet ID the Jenkins autoscaling group launches into"
  type        = string

  validation {
    condition     = can(regex("^subnet-[0-9a-f]{8,17}$", var.private_subnets))
    error_message = "private_subnets must be a subnet ID such as subnet-0123456789abcdef0."
  }
}
variable "public_subnets" {
  description = "Subnet ID the Jenkins load balancer is placed in"
  type        = string

  validation {
    condition     = can(regex("^subnet-[0-9a-f]{8,17}$", var.public_subnets))
    error_message = "public_subnets must be a subnet ID such as subnet-0123456789abcdef0."
  }
}
variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(any)

  validation {
    condition     = length(var.common_tags) <= 50
    error_message = "common_tags can hold at most 50 tags (the AWS per-resource limit)."
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
