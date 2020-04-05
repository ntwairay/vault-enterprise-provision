# export VAULT_NAMESAPCE=xxxxxxxxxxxx
# export VAULT_ADDR=https://gvt-vault-aws-prd.gcc.gov.sg:8200
# export VAULT_TOKEN=xxxxxxxxx
# export MYSQL_USERNAME=xxxxxx
# export MYSQL_PASSWORD=xxxxxx

# enable secrets engine
vault secrets enable database

# configure mysql database
vault write database/config/mysql-database \
plugin_name=mysql-database-plugin \
connection_url="{{username}}:{{password}}@tcp(10.191.1.164:3306)/" \
allowed_roles="dev-role" \
username="$MYSQL_USERNAME" \
password="$MYSQL_PASSWORD"

# configure roles
vault write database/roles/dev-role \
db_name=mysql-database \
creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';" \
default_ttl="1h" \
max_ttl="24h"

# read credential
vault read database/roles/dev-role
