provider "vault" {
  namespace = var.base_path
  alias     = "ns_base"
}

resource "vault_aws_secret_backend" "aws" {
  provider   = vault.ns_base
  path       = var.path
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "vault_aws_secret_backend_role" "role" {
  provider= vault.ns_base
  backend = vault_aws_secret_backend.aws.path
  name    = var.backend_role_name
  credential_type = var.credential_type
  role_arns       = var.role_arns
}
