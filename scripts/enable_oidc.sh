# export TENANT_ID=xxxxxxxxx
# export CLIENT_ID=xxxxxxxxx
# export CLIENT_SECRET=xxxxxxxxx
# export VAULT_NAMESAPCE=xxxxxxxxxxxx
# export VAULT_ADDR=https://gvt-vault-aws-prd.gcc.gov.sg:8200
# export VAULT_TOKEN=xxxxxxxxx

set -xe

# enable oidc
vault auth enable oidc

# write oidc configuration
vault write auth/oidc/config \
oidc_discovery_url="https://login.microsoftonline.com/88a4986e-ab2a-4006-98b6-c899a41158ab/v2.0" \
oidc_client_id="228128a6-54ed-49f9-8a0c-053928c33cae" \
oidc_client_secret="T4S6yfenXWW-3uZ-DZ4:BvzzBX-M9wCE" \
default_role="hashicorp-user"

# write role configuration
vault write auth/oidc/role/hashicorp-user user_claim="email" \
allowed_redirect_uris="http://localhost:8200/oidc/callback,https://vault.servian-sg.gradeous.io/ui/vault/auth/oidc/oidc/callback" \
groups_claim="groups" \
policies=default \
oidc_scopes="openid,profile,email" \
verbose_oidc_logging=false \
ttl=1h
