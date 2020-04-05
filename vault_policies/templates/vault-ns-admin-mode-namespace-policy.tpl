#List all access
# Create, update, and delete auth methods
path "sys/*"
{
  capabilities = ["list"]
}
# Manage all sub namespaces
path "ns*"
{
  capabilities = ["create", "update", "delete", "list", "sudo"]
}
path "sys/namespaces/ns*"
{
  capabilities = ["create", "update", "delete", "list", "sudo"]
}

# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["update", "read", "list", "sudo"]
}
# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["update"]
}
# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}
# List existing policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}
# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["read", "list"]
}
# List, create, update, and delete key/value secrets
path "kv*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "database*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "aws*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "ssh*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "pki*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Manage secrets engines
path "sys/mounts/*"
{
  capabilities = ["create","read","delete","update","list", "sudo"]
}
# List existing secrets engines.
path "sys/mounts"
{
  capabilities = ["read"]
}
# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}
