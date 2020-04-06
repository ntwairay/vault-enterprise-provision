data "vault_policy_document" "admin" {
  rule {
    path         = "sys/*"
    capabilities = ["list"]
  }
  rule {
    path         = "kv*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }
  rule {
    path         = "database*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }
  rule {
    path         = "aws*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }
  rule {
    path         = "ssh*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }
  rule {
    path         = "pki*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }
  rule {
    path         = "sys/mounts/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
  }
  rule {
    path         = "sys/mounts"
    capabilities = ["read"]
  }
}

data "vault_policy_document" "dev" {
  rule {
    path         = "auth/token/create"
    capabilities = ["create", "update"]
  }
  rule {
    path         = "kv*"
    capabilities = ["read", "update"]
  }
  rule {
    path         = "database*"
    capabilities = ["read"]
  }
  rule {
    path         = "aws*"
    capabilities = ["read"]
  }
  rule {
    path         = "ssh*"
    capabilities = ["read"]
  }
  rule {
    path         = "pki*"
    capabilities = ["read"]
  }
}
