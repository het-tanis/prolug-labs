Your team has determined they need Vault to test in their Dev environment. They've found out there is a more secure TLS mode that they could be testing in. Get that mode configured for team testing. 

Start the server in dev-tls mode

Export the required values to your shell

Verify that the server is running and then stop it.

<br>

### Tip

<details>
<summary>Tip</summary>

[Getting started with Dev Server](https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-dev-server)

</details>

### Solution
<details>
<summary>Solution</summary>

Start the vault server in dev-tls mode.

```plain
vault server -dev-tls &
```{{exec}}

Export the values you need. These can be found in the output of the above command

```plain

export VAULT_ADDR='https://127.0.0.1:8200'
export VAULT_CACERT=' <value from output>.pem '
export VAULT_TOKEN=" <token from output> "

```

Verify that the server is running

```plain
vault status
```{{exec}}

Notice the Seal Type and the Sealed value.

Check open ports

```plain
lsof -i :8200
ss -ntulp | grep 820
```{{exec}}

Stop vault by killing the above pids

```plain
kill -9 <pid of Vault>
```

</details>