### Lab Activities
Run the playbook vault_variables.yaml to see ansible run and use the vault variables.

<br>
<details>
<summary>Solution</summary>


Run the Playbook vault_variables.yaml. (You will have to put in your vault password)
```plain
ansible-playbook --ask-vault-pass vault_variables.yaml
```{{exec}}

If we were using tower, we'd store credentials securely in there and it wouldn't matter. But, as it is we have an option to keep a password file. We can use that to decrypt the vault.

```plain
echo <your password> > .passfile
```

Make sure it's readable only by your user.
```plain
chmod 400 .passfile
```{{exec}}

Run the ansible playbook and consume that password file to decrypt the vault
```
ansible-playbook --vault-password-file=.passfile vault_variables.yaml
```{{exec}}



</details>