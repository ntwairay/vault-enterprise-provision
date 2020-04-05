# export BIND_USER=xxxxxxxxx
# export BIND_PASS=xxxxxxxxx
# export VAULT_NAMESAPCE=xxxxxxxxxxxx
# export VAULT_ADDR=https://gvt-vault-aws-prd.gcc.gov.sg:8200
# export VAULT_TOKEN=xxxxxxxxx

set -xe

# enable ldap
vault auth enable ldap

# write ldap configuration
vault write auth/ldap/config \
    url="ldap://gcssmldap.gcc.gov.sg" \
    userdn="dc=gcssmldap,dc=gcc.gov.sg" \
    groupdn="ou=Admins,dc=gcssmldap,dc=gcc.gov.sg" \
    groupfilter="(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))" \
    groupattr="cn" \
    binddn="$BIND_USER" \
    bindpass="$BIND_PASS" \
    insecure_tls=true \
    starttls=false

# write ldaps configuration
# ensure ldap_ca_cert.pem is existing
# vault write auth/ldap/config \
#     url="ldaps://gcssmldap.gcc.gov.sg" \
#     userdn="dc=gcssmldap,dc=gcc.gov.sg" \
#     groupdn="dc=gcssmldap,dc=gcc.gov.sg" \
#     groupfilter="(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))" \
#     groupattr="cn" \
#     certificate=@ldap_ca_cert.pem \
#     binddn="$BIND_USER" \
#     bindpass="$BIND_PASS" \
#     insecure_tls=false \
#     starttls=true
