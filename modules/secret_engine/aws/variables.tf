variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "backend_role_name" {
  default = "aws_default_iam_role"
}

variable "credential_type" {
  default = "iam_user"
}

variable "policy_document" {
  default = {}
}

variable "base_path" {
  description = "The namespace path this one is nested in if any"
  type        = string
  default     = ""
}

variable "role_arns" {
  default = ["arn:aws:iam::147023583094:user/CloudAdmin"]
}

variable "path" {
  default = "aws"
}
