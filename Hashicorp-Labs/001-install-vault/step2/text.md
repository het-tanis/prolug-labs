So far you've installed Vault on the server. Do some basic checks to see that it is correctly setup.

Check where the system installed Vault

Check Vault functionality

Start a dev instance of Vault on your server

<br>

### Solution
<details>
<summary>Solution</summary>
Check where the system put vault binary.

```plain
which vault
```{{exec}}

Verify Vault functionality.

```plain
vault
```{{exec}}

Make sure you look at some of the capabilities you have with Vault.

Start the vault server in dev mode.

```plain
vault server -dev &
```{{exec}}

Check the vault server status

```plain
lsof -i :8200
```{{exec}}

If that's all worked, then the system is correctly set up.

</details>