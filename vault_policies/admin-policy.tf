data "template_file" "admin_policy" {
  template = "${file("${path.module}/templates/admin-policy.tpl")}"
}

resource "vault_policy" "admin_policy" {
    name   = "vault-admin"
    policy = data.template_file.admin_policy.rendered
}
