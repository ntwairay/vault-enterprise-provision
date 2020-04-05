# export VAULT_NAMESAPCE=xxxxxxxxxxxx
# export VAULT_ADDR=https://gvt-vault-aws-prd.gcc.gov.sg:8200
# export TARGET_HOST=10.195.55.13
# export VAULT_TOKEN=xxxxxxxxx


# locate or generate the SSH public key. Usually this is ~/.ssh/id_rsa.pub. If you do not have an SSH keypair, generate one:
# ssh-keygen -t rsa -C "user@example.com"

# ask Vault to sign your public key
vault write -field=signed_key ssh-client-signer/sign/dev-role \
    public_key=@$HOME/.ssh/id_rsa.pub > signed-cert.pub

# edit the permission for signed-cert.pub
chmod 400 ./signed-cert.pub

# ssh into the target host
ssh -i signed-cert.pub -i ~/.ssh/id_rsa ec2-user@$TARGET_HOST
