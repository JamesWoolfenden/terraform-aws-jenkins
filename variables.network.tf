variable "public_subnets" {
  description = "Subnet ID the Jenkins load balancer is placed in"
  type        = string

  validation {
    condition     = can(regex("^subnet-[0-9a-f]{8,17}$", var.public_subnets))
    error_message = "public_subnets must be a subnet ID such as subnet-0123456789abcdef0."
  }
}
variable "ssh_allowed_ip" {
  description = "CIDR block allowed to reach SSH on the instance and HTTPS on the load balancer"
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_allowed_ip, 0))
    error_message = "ssh_allowed_ip must be a valid CIDR block such as 203.0.113.10/32."
  }
}
variable "elb_required" {
  description = "Set to 1 to create the classic load balancer and its security group, 0 to skip"
  default     = 0
  type        = number

  validation {
    condition     = contains([0, 1], var.elb_required)
    error_message = "elb_required must be 0 or 1."
  }
}
variable "elb_connection_draining" {
  description = "Whether the load balancer drains connections from deregistering instances"
  type        = bool
  default     = false
}
variable "elb_internal" {
  description = "Whether the load balancer is internal (true) or internet-facing (false)"
  type        = bool
  default     = false
}
variable "sslarn" {
  description = "ARN of the ACM certificate used by the HTTPS listener on the load balancer"
  type        = string
  default     = ""

  validation {
    condition     = var.sslarn == "" || can(regex("^arn:aws[a-z-]*:acm:[a-z0-9-]+:[0-9]{12}:certificate/.+$", var.sslarn))
    error_message = "sslarn must be empty or an ACM certificate ARN."
  }
}
