Your team has determined they need Terraform to test in their Dev environment. Setup the Hashicorp repo on Ubuntu and then install Terraform.

Configure Hashicorp repo.

Install Terraform on the server

<br>

### Tip

<details>
<summary>Tip</summary>

[Instruction Reference for terraform install](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

</details>

### Solution
<details>
<summary>Solution</summary>

Add PGP for the package signing key

```plain
apt update && apt install gpg
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

Update and install terraform

```plain
apt update && apt install terraform
```{{exec}}


</details>