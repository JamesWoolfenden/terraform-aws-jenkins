variable "instance_size" {
  description = "The size type for the jenkins instance"
  type        = string
  default     = "t2.micro"
}
variable "jenkins_name" {}
variable "max_size" {
  default = 1
  type    = number
}

variable "min_size" {
  default = 1
  type    = number
}

variable "patchgroup" {}
variable "private_subnets" {}
variable "public_subnets" {}

variable "route53" {
  default     = ""
  description = ""
  type        = string
}

variable "sslarn" {
  default = 0
}

variable "ssm_tag_name" {}

variable "ssm_tag_value" {}

variable "zoneid" {
  default     = ""
  description = ""
  type        = string
}

variable "region" {
  default     = "eu-west-1"
  description = ""
  type        = string
}


variable "allowed_ips" {}

variable "common_tags" {
  type = "map"
}

variable "trusted_role_arns" {
  default     = ""
  description = ""
  type        = string
}

variable "role_arns" {
  default     = ""
  description = ""
  type        = string
}

variable "jenkins_ami_version" {
  type = number
}

variable "elb_required" {
  default = 0
  type    = number
}

variable "vpc_id" {
  default     = "eu-west-1"
  description = ""
  type        = string
}

variable "elb_connection_draining" {
  default = false
}

variable "elb_internal" {
  default = false
}

variable "route53_required" {
  default = 0
}
