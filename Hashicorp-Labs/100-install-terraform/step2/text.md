So far you've installed Terraform on the server. Do some basic checks to see that it is correctly setup.

Check where the system installed Terraform

Check Terraform functionality

<br>

### Solution
<details>
<summary>Solution</summary>
Check where the system put Terraform binary.

```plain
which terraform
```{{exec}}

Verify Terraform functionality.

```plain
terraform -help
```{{exec}}

Make sure you look at some of the capabilities you have with Terraform.

Check Terraform subcommands

```plain
terraform -help plan
```{{exec}}

If you've gotten output back, you've installed Terraform and are ready to go with future labs. 

</details>