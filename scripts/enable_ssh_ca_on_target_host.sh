# export VAULT_NAMESAPCE=xxxxxxxxxxxx
# export VAULT_ADDR=https://gvt-vault-aws-prd.gcc.gov.sg:8200
# export VAULT_TOKEN=xxxxxxxxx

# enable ssh-ca
vault secrets enable -path=ssh-client-signer ssh

# write ssh-ca configuration
vault write ssh-client-signer/config/ca generate_signing_key=true

# write public key into the target host
echo $(vault read -field=public_key ssh-client-signer/config/ca) | sudo tee -a /etc/ssh/trusted-user-ca-keys.pem

# add trusted user ca keys to sshd configuration
echo 'TrustedUserCAKeys /etc/ssh/trusted-user-ca-keys.pem' | sudo tee -a /etc/ssh/sshd_config

# create a named Vault role for signing client keys
vault write ssh-client-signer/roles/dev-role -<<"EOH"
{
  "allow_user_certificates": true,
  "allowed_users": "*",
  "default_extensions": [
    {
      "permit-pty": ""
    }
  ],
  "key_type": "ca",
  "default_user": "ec2-user",
  "ttl": "30m0s"
}
EOH
