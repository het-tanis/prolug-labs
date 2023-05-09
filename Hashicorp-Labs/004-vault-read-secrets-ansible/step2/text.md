You've got vault running and you've created the secret. Now you need to create a programmatic access to access that secret. The method we'll use is username and password.

Enable the vault userpass authentication.

Create a user for vault.

Assign the user a password.

Create and assign that user a vault policy to read secret/app1/values secret.


<br>


### Solution
<details>
<summary>Solution</summary>

Allow vault to use usernames and passwords

```plain
vault auth enable userpass
```{{exec}}

Create the user for vault

```plain
vault write auth/userpass/users/ansible password=ansible12#$
```{{exec}}

Create a policy to allow reads of secret/app1/values secret

```plain
cat > /root/ansible-policy.hcl <<-EOF
# Write and manage secrets in key-value secrets engine
path "secret*" {
  capabilities = [ "create", "read", "update", "delete", "list", "patch" ]
}
EOF
```{{exec}}

Write the vault policy into vault

```plain
vault policy write ansible_policy /root/ansible-policy.hcl 
```{{exec}}

Map the policy to the user ansible

```plain
vault write /auth/userpass/users/ansible policies=ansible_policy
```{{exec}}

Verify the mapping of the policy.

```plain
vault read auth/userpass/users/ansible
```{{exec}}

With this all set up, you're ready to move on to the next part of the lab.

</details>