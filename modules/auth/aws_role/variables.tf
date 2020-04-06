variable "path" {
  default = "aws"
}

variable "role" {
  default = "dev-role"
}

variable "auth_type" {
  default = "iam"
}

variable "bound_iam_principal_arns" {
  default = []
}

variable "token_ttl" {
  default = 60
}

variable "token_max_ttl" {
  default = 120
}

variable "token_policies" {
  default = ["admin"]
}
