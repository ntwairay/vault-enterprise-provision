resource "vault_auth_backend" "aws" {
  provider    = vault.ns_base
  type        = var.path
}

resource "vault_aws_auth_backend_role" "example" {
  provider    = vault.ns_base
  backend                         = vault_auth_backend.aws.path
  role                            = var.role
  auth_type                       = var.auth_type
  bound_iam_principal_arns        = var.bound_iam_principal_arns
  token_ttl                       = var.token_ttl
  token_max_ttl                   = var.token_max_ttl
  token_policies                  = var.token_policies
