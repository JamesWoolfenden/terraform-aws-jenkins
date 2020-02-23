variable "instance_size" {
  description = "The size type for the jenkins instance"
  type        = string
  default     = "t2.micro"
}

variable "jenkins_name" {
  type = string
}

variable "max_size" {
  default = 1
  type    = number
}

variable "min_size" {
  default = 1
  type    = number
}

variable "patchgroup" {
  type = string

}

variable "private_subnets" {
  type = string
}

variable "public_subnets" {
  type = string
}

variable "route53" {
  default     = ""
  description = ""
  type        = string
}

variable "ssm_tag_name" {
  type = string
}

variable "ssm_tag_value" {
  type = string
}

variable "zoneid" {
  default     = ""
  description = "Route53 Zone"
  type        = string
}

variable "ssh_allowed_ip" {
  description = "Ssh Allowed IP"
  type        = string
}

variable "common_tags" {
  type = "map"
}

variable "jenkins_ami_version" {
  type = string
}

variable "elb_required" {
  default = 0
  type    = number
}

variable "vpc_id" {
  description = ""
  type        = string
}

variable "elb_connection_draining" {
  type    = bool
  default = false
}

variable "elb_internal" {
  type    = bool
  default = false
}

variable "route53_required" {
  type    = number
  default = 0
}

variable "role_arns" {
  type    = string
  default = ""
}

variable "trusted_role_arns" {
  type    = string
  default = ""
}

variable "sslarn" {
  type    = string
  default = ""
}
