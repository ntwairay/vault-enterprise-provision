provider "vault" {
  namespace = var.base_path
  alias     = "ns_base"
}

resource "vault_auth_backend" "approle" {
  provider    = vault.ns_base
  type        = "approle"
}

resource "vault_approle_auth_backend_role" "example" {
  provider       = vault.ns_base
  backend        = vault_auth_backend.approle.path
  role_name      = var.role_name
  token_policies = var.token_policies
}
