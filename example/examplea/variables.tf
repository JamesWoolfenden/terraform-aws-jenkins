
variable "jenkins_name" {}

variable "patchgroup" {}

variable "private_subnets" {
  type = string
}

variable "public_subnets" {}

variable "common_tags" {
  type = map(any)
}

variable "vpc_id" {}
