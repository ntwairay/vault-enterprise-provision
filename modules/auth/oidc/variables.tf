variable "base_path" {
  description = "The namespace path this one is nested in if any"
  type        = string
  default     = "hashicorp"
}

variable "oidc_discovery_url" {
  default = ""
}

variable "oidc_client_id" {
  default = ""
}

variable "oidc_client_secret" {
  default = ""
}

variable "path" {
  default = "oidc"
}

variable "default_role" {
  default = ""
}

variable "token_policies" {
  default = ["default"]
}

variable "user_claim" {
  default = "email"
}

variable "groups_claim" {
  default = "groups"
}

variable "oidc_scopes" {
  default = ["openid","profile","email"]
}

variable "token_ttl" {
  default = 60
}

variable "allowed_redirect_uris" {
  default = []
}
