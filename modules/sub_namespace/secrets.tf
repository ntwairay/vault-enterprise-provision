# resource "vault_mount" "sec_kv" {
#   provider = vault.ns_two
#
#   path        = "sec_kv"
#   type        = "kv-v2"
#   description = "A Key/Value secret store"
# }
#
# resource "vault_mount" "sec_transit" {
#   provider = vault.ns_two
#
#   path        = "sec_transit"
#   type        = "transit"
#   description = "Encryption as a Service backend"
# }
