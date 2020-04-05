# provider "vault" {
#   namespace = var.base_path
#   alias     = "ns_base"
# }

# resource "vault_jwt_auth_backend" "oidc" {
#   path = var.path
#   default_role = var.default_role
# }

resource "vault_jwt_auth_backend" "oidc" {
    description  = "Configuration of the Terraform OIDC auth backend"
    path = var.path
    default_role = var.default_role
    oidc_discovery_url = var.oidc_discovery_url
    oidc_client_id = var.oidc_client_id
    oidc_client_secret = var.oidc_client_secret
}

resource "vault_jwt_auth_backend_role" "oidc" {
  backend         = vault_jwt_auth_backend.oidc.path
  role_name       = var.default_role
  token_policies  = var.token_policies
  groups_claim    = var.groups_claim
  user_claim            = var.user_claim
  oidc_scopes           = var.oidc_scopes
  token_ttl             = var.token_ttl
  role_type             = "oidc"
  allowed_redirect_uris = var.allowed_redirect_uris
  verbose_oidc_logging  = false
}
