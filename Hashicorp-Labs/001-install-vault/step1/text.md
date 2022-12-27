Your team has determined they need Vault to test in their Dev environment. Setup the Hashicorp repo on Ubuntu and then install vault.

Configure Hashicorp repo.

Install Vault on the server

<br>

### Tip

<details>
<summary>Tip</summary>

[Instruction Reference for vault install](https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-install)

</details>

### Solution
<details>
<summary>Solution</summary>

Add PGP for the package signing key

```plain
sudo apt update && sudo apt install gpg
```{{exec}}

Add the HashiCorp GPG key

```plain
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
```{{exec}}

Verify the key fingerprint

```plain
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
```{{exec}}

Add the repository for HashiCorp 

```plain
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```{{exec}}

Update and install vault

```plain
sudo apt update && sudo apt install vault
```{{exec}}


</details>