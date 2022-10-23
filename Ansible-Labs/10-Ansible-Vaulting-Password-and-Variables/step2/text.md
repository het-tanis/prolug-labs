### Lab Activities
Create your ansible vault


<br>
<details>
<summary>Solution</summary>

Create a vault using Ansible. You will be asked to give a password, make sure you remember it.
```plain
ansible-vault create vault.yaml
```{{exec}}

Add the following information:

```
username: user1
password: somestrongpassword
```

Verify that you cannot read the file.
```plain
cat vault.yaml
```{{exec}}

View the vault with ansible-vault command. You will have to add in the password
```plain
ansible-vault view vault.yaml
```{{exec}}

</details>