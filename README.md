# Terraform Vault Provision - GovTech Secrets Management

This repo provisions and maintains the configuration for the Namespaces within Vault Enterprise node/cluster via Terraform.
Terraform needs to be applied with sufficient permissions to create namespaces and other config in the root name space.

The content of this is meant to be utilised by GovTech Vault Admin Operators who need to manage the Vault application at the root namespace as well as provision
new namespaces for various tenant agencies. 

## Assumptions
- You have already configured vault enterprise and unsealed vault via one of many unseal mechanisms
- You have a vault token (eg initial root vault token) that has permissions to perform adminstrative actions in the root vault namespace
- You have chosen OIDC as your main human user auth method (eg Azure AD) to Vault
- Azure AD will manage users and groups, therefore only a reference to the Azure AD group is required. Azure AD will be where team members can be added to the respective groups that will map to a vault namespace group. 
- The team will nominate one or more namespace admins for the namespace. 
- Each team will use a sub namespace per app, which will have multiple secret engines in each.
- Namespace admins will enable any secret engines within their namespace themselves.


## Variables

```
 "oidc_auth_accessor"  "The access for the OIDC authe backend."
 "vault_admin_group" "Azure-SOI-VaultAdmin-Owner ObjectID"
 "vault_app1_dev_group" "Azure-SOI-VaultAdmin-App_1-Group ObjectID"
 "vault_app2_dev_group"  "Azure-SOI-VaultAdmin-App_2-Group ObjectID"
 "agency_x_admin_group"  "Agency X admin ObjectID"
 "agency_x_app1_dev_group"  "Azure-XXX-Agency X-App_1-Group ObjectID"
 "agency_x_app2_dev_group"  "Azure-XXX-Agency X-App_2-Group ObjectID"
 ```

 * all found in the variables.tf file

## Modules

### Namespace
The Namespace Module creates a namespace and mounts a KV store and Transit secret backend. 
Its alo greates an admin group and dev group with a policy attached.

### parameters

namespace_name = name of the namespace
base_path      = path of the paarent namespace
group_names = group names list
root_groups = group ids to link in the root namespace.

## Who would use this module
- Vault Admins to manage namespaces


## TO DO
- Add more default engines
- Add policy to lock down Namespace Admin/Group the ability to add members to their own groups
