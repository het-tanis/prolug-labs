Your team has determined they need Vault to test in their Dev environment. Hashicorp Vault has been installed on the server. 

Start the server with UI enabled.

Verify the server is running and connect to it via the correct port.



<br>

### Tip

<details>
<summary>Tip</summary>

[Getting started with the UI](https://developer.hashicorp.com/vault/tutorials/getting-started-ui/getting-started-ui)

</details>

### Solution
<details>
<summary>Solution</summary>

Start the Vault server with the UI enabled.

```plain
mkdir -p /opt/vault/data
cd /opt/vault
```{{exec}}

Create a config file for vault that starts it and lets the server know where to store the raft data

```plain

tee config.hcl <<EOF
ui = true
disable_mlock = true

storage "raft" {
  path    = "/opt/vault/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = "true"
}

api_addr = "http://127.0.0.1:8200"
cluster_addr = "https://127.0.0.1:8201"
EOF

```{{exec}}

Cat out the file and verify everything looks correct

```plain
cat /opt/vault/config.hcl
```{{exec}}

Start the server with the config file.

```plain
vault server -config=config.hcl &
```{{exec}}

Verify that the server is listening on the proper ports.

If you do not see a command prompt, hit enter before continuing.

```plain
lsof -i :8200
ss -ntulp | grep 820
```{{exec}}

Connect to the port and verify that the server is running

{{TRAFFIC_HOST1_8200}}

That's it for this portion, setup will be in step 2.

</details>