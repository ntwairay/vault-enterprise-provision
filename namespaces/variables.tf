variable "oidc_auth_accessor" {
  description = "The access for the OIDC auth backend in the root namespace"
  type        = string
}

variable "ldap_auth_accessor" {
  default = ""
}

# Azure-Group ID for Vault Admins
variable "vault_admin_group" {
  description = "Azure-AD Group ObjectID"
  type        = string
  default     = "4f252e17-f877-4177-8fba-f40764222cd8"
}

variable "vault_admin_app1_dev_group" {
  description = "Azure-SOI-CloudEngineering-App_1-Group ObjectID"
  type        = string
  default     = "8dadc36e-4444-3333-2222-111111111111"
}

variable "vault_admin_app2_dev_group" {
  description = "Azure-SOI-CloudEngineering-App_2-Group ObjectID"
  type        = string
  default     = "8dadc36e-4444-3333-2222-000000000000"
}


## Team X Azure AD details
variable "team_x_admin_group" {
  description = "Azure-XXX-CloudEngineering-Owner ObjectID"
  type        = string
  default     = "ba93a813-016d-43b0-9a33-a82e9f69eb6f"
}

variable "team_x_app1_dev_group" {
  description = "Azure-XXX-CloudEngineering-App_1-Group ObjectID"
  type        = string
  default     = "8dadc36e-4444-xxxx-2222-333333333333"
}

variable "team_x_app2_dev_group" {
  description = "Azure-XXX-CloudEngineering-App_2-Group ObjectID"
  type        = string
  default     = "8dadc36e-4444-xxxx-2222-aaaaaaaaaaaa"
}



## Team C Azure AD details
variable "team_c_admin_group" {
  description = "Azure-Azure-TEAMC-DevOps-Contributor"
  type        = string
  default     = "07306a6d-7bc2-4f0d-94ad-6a0ceb550008"
}

variable "team_c_app1_dev_group" {
  description = "Azure-TEAMC-DevOps-Contributor ObjectID"
  type        = string
  default     = "07306a6d-7bc2-4f0d-94ad-000000000000"
}

variable "team_c_app2_dev_group" {
  description = "Azure-team_c-DevOps-Contributor ObjectID"
  type        = string
  default     = "07306a6d-7bc2-4f0d-94ad-333333333333"
}
