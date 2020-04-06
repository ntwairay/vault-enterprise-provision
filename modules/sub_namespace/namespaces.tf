provider "vault" {
  namespace = var.base_path
  alias     = "ns_base"
}

##### below is inside NS_TWO

locals {
  group_policy_doc = [data.vault_policy_document.admin.hcl]
}

resource "vault_identity_group" "group" {
  count    = length(var.group_names)
  provider = vault.ns_base

  name              = var.group_names[count.index]
  type              = "internal"
  external_policies = false
  policies          = [var.group_names[count.index], "default"]

  member_group_ids = [var.root_groups[count.index]]

  depends_on = [vault_policy.policy]
}

resource "vault_policy" "policy" {
  count    = length(local.group_policy_doc)
  provider = vault.ns_base

  name   = var.group_names[count.index]
  policy = local.group_policy_doc[count.index]

}

resource "vault_policy" "dev_policy" {
  provider = vault.ns_base

  name   = "application"
  policy = data.vault_policy_document.dev.hcl

}
