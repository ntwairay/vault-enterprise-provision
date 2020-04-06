variable "role_id" {
  default = ""
}

variable "secret_id" {
  default = ""
}

variable "oidc_client_id" {
  default = ""
}

variable "oidc_client_secret" {
  default = ""
}

variable "oidc_tenant_id" {
  default = ""
}

variable "ldap_url" {
  default = ""
}

variable "binddn" {
  default = ""
}

variable "bindpass" {
  default = ""
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
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
  default = ["arn:aws:iam::1233455554:user/CloudAdmin"]
}
