Now that you have vault running you need to create a secret. You will be reading this secret from another tool, and in a real environment it could be populate by another process or team.

Create the secret username and password for the application to read.

Verify that the username and password have been set.

<br>


### Solution
<details>
<summary>Solution</summary>

Verify that the secrets engine v2 is running

```plain
vault secrets list -detailed
```{{exec}}

Create the vault secret of the username and password for the application

```plain
vault kv put secret/app1/values username=secretuser password=supersecure
```{{exec}}

Verify that the values have been set.

```plain
vault kv get secret/app1/values
```{{exec}}

Now that you've created those values, it's time to move on to the next step of the lab.

</details>