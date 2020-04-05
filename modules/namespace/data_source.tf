data "vault_policy_document" "admin" {
  rule {
    path         = "sys/*"
    capabilities = ["list"]
  }
  rule {
    path         = "sys/namespaces/ns*"
    capabilities = ["create", "update", "delete", "list", "sudo"]
  }
  rule {
    path         = "auth/*"
    capabilities = ["update", "read", "list", "sudo"]
  }
  rule {
    path         = "sys/auth/*"
    capabilities = ["update"]
  }
  rule {
    path         = "sys/auth"
    capabilities = ["read"]
  }
  rule {
    path         = "sys/policies/acl"
    capabilities = ["list"]
  }
  rule {
    path         = "sys/policies/acl/*"
    capabilities = ["read", "list"]
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
}
