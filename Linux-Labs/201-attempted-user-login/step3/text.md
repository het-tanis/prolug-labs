The realuser user is now set up and we want to key root to log in as that user. This isn't extremely practical, but is useful in testing to create a key and see the user connect via a key.

Create a key for root called realuser_rsa

Push key over to node01 for realuser login (from root)

Test and see that you are that user.

<br>

### Solution
<details>
<summary>Solution</summary>
Create a key in the root account that we can push over to node01 and authenticate with

This will be interactive, choose file to save the key /root/.ssh/realuser_rsa
All the rest can be left blank, just hit enter.

```plain
ssh-keygen
```{{exec}}

You can verify the new keys with the command below

```plain
ls -l /root/.ssh
```{{exec}}

Note: You created a named file realuser_rsa (private key) and a realuser_rsa.pub (public key)

Push the key file over to realuser@node01 (You will need to use your password from step2)

```plain
ssh-copy-id -i /root/.ssh/realuser_rsa.pub realuser@node01
```{{exec}}

Test your connection via your private key into realuser@node01.

```plain
ssh -i /root/.ssh/realuser_rsa realuser@node01 'hostname; id'
```{{exec}}

You were able to create and push over a keypair. You then used that keypair to connect to the server as that user.

</details>