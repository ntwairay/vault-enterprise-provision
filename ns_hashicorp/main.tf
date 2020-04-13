# configure vault provider for namespace
provider "vault" {
  namespace = "hashicorp"
  alias     = "ns_base"
}

# create namespace
resource "vault_namespace" "hashicorp" {
  path = "hashicorp"
}

# oidc auth
module "oidc" {
  source = "../modules/auth/oidc"

  path           = "oidc"
  default_role   = "hashicorp-namespace-admin"
  # base_path      = vault_namespace.hashicorp.path
  user_claim     = "email"
  oidc_scopes    = ["openid","profile","email"]
  oidc_client_id = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  oidc_discovery_url = "https://login.microsoftonline.com/${var.oidc_tenant_id}/v2.0"
  allowed_redirect_uris = ["http://localhost:8200/oidc/callback", "https://vault.servian-sg.gradeous.io/ui/vault/auth/oidc/oidc/callback"]
}

# external group for group alias
resource "vault_identity_group" "hashicorp_namespace_admin" {
  name = "hashicorp_namespace_admin"
  type = "external"

  policies = ["default"]
  depends_on = [module.oidc]
}

# group alias setup with oidc auth method
resource "vault_identity_group_alias" "hashicorp_namespace_admin" {
  name           = "7f5421f4-9407-4885-b66d-a9b564fc6f71"
  mount_accessor = module.oidc.accessor
  canonical_id   = vault_identity_group.hashicorp_namespace_admin.id
}

# configure namespace
module "hashicorp" {
  source = "../modules/namespace"

  base_path   = vault_namespace.hashicorp.path
  group_names = ["admin"]
  root_groups = [vault_identity_group.hashicorp_namespace_admin.id]
}

# ----------------------------------------------------------------------------------------------------------------------------------
# configure vault provider for sub namespace
provider "vault" {
  namespace = "hashicorp/ns_app1"
  alias     = "ns_sub"
}
# create sub namepaces
resource "vault_namespace" "hashicorp_ns_app1" {
  provider = vault.ns_base
  path = "ns_app1"
  depends_on = [vault_namespace.hashicorp]
}
# ldap auth
module "hashicorp_ns_app1_ldap" {
  source = "../modules/auth/ldap"
  base_path   = vault_namespace.hashicorp.path
  path        = "ldap"
  ldap_url    = var.ldap_url
  userdn      = "ou=users,dc=example,dc=org"
  userattr    = "cn"
  discoverdn  = false
  groupdn     = "ou=groups,dc=example,dc=org"
  group_filter = "(objectclass=groupOfNames)"
  group_name   = "dev"
  binddn       = var.binddn
  bindpass     = var.bindpass
  insecure_tls = true
}
# approle auth
module "hashicorp_ns_app1_approle" {
  source = "../modules/auth/approle"

  base_path      = join("/", [vault_namespace.hashicorp.path, vault_namespace.hashicorp_ns_app1.path])
  role_name      = "dev-role"
  token_policies = ["application"]
}

# external group for group alias
resource "vault_identity_group" "hashicorp_ns_app1_admin" {
  provider = vault.ns_base
  name = "hashicorp_ns_app1_admin"
  type = "external"

  policies = ["default"]
  depends_on = [module.hashicorp_ns_app1_ldap]
}

# group alias setup with ldap auth method
resource "vault_identity_group_alias" "hashicorp_ns_app1_admin" {
  provider = vault.ns_base
  name           = "dev"
  mount_accessor = module.hashicorp_ns_app1_ldap.accessor
  canonical_id   = vault_identity_group.hashicorp_ns_app1_admin.id
}

# configure sub namespace
module "hashicorp_ns_app1" {
  source = "../modules/sub_namespace"

  base_path   = join("/", [vault_namespace.hashicorp.path, vault_namespace.hashicorp_ns_app1.path])
  group_names = ["admin"]
  root_groups = [vault_identity_group.hashicorp_ns_app1_admin.id]
}

# configure aws secret engine
module "hashicorp_ns_app1_aws_secret_engine" {
  source = "../modules/secret_engine/aws"

  base_path  = join("/", [vault_namespace.hashicorp.path, vault_namespace.hashicorp_ns_app1.path])
  path       = "aws-dev"
  access_key = var.access_key
  secret_key = var.secret_key
  backend_role_name = "aws_dev_iam_role"
  credential_type   = "assumed_role"
  role_arns         = ["arn:aws:iam::${var.aws_account_id}:role/ptfe_role"]
}
