module "oidc" {
  source = "../modules/auth/oidc"

  path           = "oidc"
  default_role   = "hashicorp-namespace-admin"
  # base_path      = vault_namespace.hashicorp.path
  oidc_scopes    = ["openid","profile","email"]
  oidc_client_id = "228128a6-54ed-49f9-8a0c-053928c33cae"
  oidc_client_secret = "T4S6yfenXWW-3uZ-DZ4:BvzzBX-M9wCE"
  oidc_discovery_url = "https://login.microsoftonline.com/88a4986e-ab2a-4006-98b6-c899a41158ab/v2.0"
  allowed_redirect_uris = ["http://localhost:8200/oidc/callback", "https://vault.servian-sg.gradeous.io/ui/vault/auth/oidc/oidc/callback"]
}


resource "vault_identity_group" "hashicorp_namespace_admin" {
  name = "hashicorp_namespace_admin"
  type = "external"

  policies = ["default"]
}

# oidc for vault admin and namespace admin
resource "vault_identity_group_alias" "hashicorp_namespace_admin" {
  name           = "7f5421f4-9407-4885-b66d-a9b564fc6f71"
  mount_accessor = module.oidc.accessor
  canonical_id   = vault_identity_group.hashicorp_namespace_admin.id
}


resource "vault_namespace" "hashicorp" {
  path = "hashicorp"
}

module "hashicorp" {
  source = "../modules/namespace"

  base_path   = vault_namespace.hashicorp.path
  group_names = ["admin"]
  root_groups = [vault_identity_group.hashicorp_namespace_admin.id]
}

provider "vault" {
  namespace = "hashicorp"
  alias     = "ns_base"
}

# sub namepaces
resource "vault_namespace" "hashicorp_ns_app1" {
  provider = vault.ns_base
  path = "ns_app1"
}

provider "vault" {
  namespace = "hashicorp/ns_app1"
  alias     = "ns_sub"
}

module "ldap" {
  source = "../modules/auth/ldap"
  base_path   = vault_namespace.hashicorp.path
  path        = "ldap"
  ldap_url    = "ldap://13.239.8.17"
  userdn      = "ou=users,dc=example,dc=org"
  userattr    = "cn"
  discoverdn  = false
  groupdn     = "ou=groups,dc=example,dc=org"
  group_filter = "(objectclass=groupOfNames)"
  group_name   = "dev"
  binddn       = "cn=admin,dc=example,dc=org"
  bindpass     = "admin"
  insecure_tls = true
}

resource "vault_identity_group" "hashicorp_ns_app1_admin" {
  provider = vault.ns_base
  name = "hashicorp_ns_app1_admin"
  type = "external"

  policies = ["default"]
}

resource "vault_identity_group_alias" "hashicorp_ns_app1_admin" {
  provider = vault.ns_base
  name           = "dev"
  mount_accessor = module.ldap.accessor
  canonical_id   = vault_identity_group.hashicorp_ns_app1_admin.id
}

module "hashicorp_ns_app1" {
  source = "../modules/namespace"

  base_path   = join("/", [vault_namespace.hashicorp.path, vault_namespace.hashicorp_ns_app1.path])
  group_names = ["admin"]
  root_groups = [vault_identity_group.hashicorp_ns_app1_admin.id]
}
