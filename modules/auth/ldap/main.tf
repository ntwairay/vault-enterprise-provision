provider "vault" {
  namespace = var.base_path
  alias     = "ns_base"
}

resource "vault_ldap_auth_backend" "ldap" {
    provider    = vault.ns_base
    path        = var.path
    url         = var.ldap_url
    binddn      = var.binddn
    bindpass    = var.bindpass
    userdn      = var.userdn
    userattr    = var.userattr
    discoverdn  = var.discoverdn
    groupdn     = var.groupdn
    groupfilter = var.group_filter
    insecure_tls = var.insecure_tls
}

resource "vault_ldap_auth_backend_group" "group" {
    provider  = vault.ns_base
    groupname = var.group_name
    backend   = vault_ldap_auth_backend.ldap.path
}
