variable "role_arns" {
  description = "ARN of the role in another account that the Jenkins role is allowed to assume"
  type        = string
  default     = ""

  validation {
    condition     = var.role_arns == "" || can(regex("^arn:aws[a-z-]*:iam::[0-9]{12}:role/.+$", var.role_arns))
    error_message = "role_arns must be empty or an IAM role ARN."
  }
}
variable "trusted_role_arns" {
  description = "ARN of the principal in another account that is trusted to assume the Jenkins role"
  type        = string
  default     = ""

  validation {
    condition     = var.trusted_role_arns == "" || can(regex("^arn:aws[a-z-]*:iam::[0-9]{12}:(root|role/.+|user/.+)$", var.trusted_role_arns))
    error_message = "trusted_role_arns must be empty or an IAM account root, role or user ARN."
  }
}
