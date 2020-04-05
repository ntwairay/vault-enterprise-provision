# Restricted Admin Mode for hashicorp namespace
# List everything under hashicorp
path "hashicorp/*"
{
  capabilities = ["list", "sudo"]
}
# List auth methods under hashicorp
path "hashicorp/sys/auth"
{
  capabilities = ["read"]
}
# Manage Auth under hashicorp
path "hashicorp/sys/auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Create and manage ACL policies under hashicorp
path "hashicorp/sys/capabilities-self" {
  capabilities = ["read", "update", "list", "sudo"]
}
path "hashicorp/sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Restricted admin mode for GovTech namespace
path "govtech/*"
{
  capabilities = ["list", "sudo"]
}
# List auth methods under govtech
path "govtech/sys/auth"
{
  capabilities = ["read"]
}
# Manage Auth under govtech
path "govtech/sys/auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Create and manage ACL policies under govtech
path "govtech/sys/capabilities-self" {
  capabilities = ["read", "update", "list", "sudo"]
}
path "govtech/sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# root
# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}
# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}
# List existing policies
path "sys/policies"
{
  capabilities = ["list"]
}
# Create and manage ACL policies
path "sys/policies/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# List, create, update, and delete key/value secrets
path "secret/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Manage secrets engines
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
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
