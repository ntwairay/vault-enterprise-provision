# resource "vault_token" "admin_role_token" {
#     role_name = "vault-admin"
#     policies  = [vault_policy.admin_policy.name]
#     renewable = true
#     ttl       = "24h"
#
#     renew_min_lease = 43200
#     renew_increment = 86400
# }
