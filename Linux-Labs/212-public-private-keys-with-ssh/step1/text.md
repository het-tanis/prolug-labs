Your team is trying to better adhere to NIST SP 800-57. Which can be reviewed [here](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-57pt1r5.pdf). Recently a key was found for root that had not been changed for over 15 years. 

You have decided to learn more about how key management works in Linux.

1. Generate some key pairs and look at them from a system and a cryptography view.

2. Verify that the keys are cryptographically similar.

3. Regenerate a public key that has been lost for a private key that you have kept protected.

<br>

### Solution
<details>
<summary>Solution</summary>

Make a directory for your testing

```plain
mkdir /root/keys
```{{exec}}

Go into that directory

```plain
cd /root/keys
```{{exec}}

Generate some keys and keypairs, ensuring that you do not overwrite your keys in /root/.ssh/

```plain
ssh-keygen
```{{exec}}

Follow the prompts and make a key pair ProLUG

```plain
ubuntu:~/keys$ ssh-keygen 
Generating public/private ed25519 key pair.
Enter file in which to save the key (/root/.ssh/id_ed25519): ProLUG
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in ProLUG
Your public key has been saved in ProLUG.pub
The key fingerprint is:
```

Inspect what was generated for permissions and ownership from a Linux system perspective.

```plain
ls -l 
```{{exec}}

Can you tell the public from the private version of the key?

What are the permissions of the two keys?

Test the keys for cryptographic similarity.

```plain
ssh-keygen -y -e -f ProLUG
ssh-keygen -l -f ProLUG
```{{exec}}

```plain
ssh-keygen -y -e -f ProLUG.pub
ssh-keygen -l -f ProLUG.pub
```{{exec}}

Do you see that they have the exact same fingerprint? 

Delete the .pub public key and regenerate it from the private key.

```plain
rm -rf /root/keys/ProLUG.pub
```{{exec}}

Validate that you do not see the key

```plain
ls -l 
```{{exec}}

Generate a new public key from the private one.

```plain
ssh-keygen -f ProLUG -y > ProLUG.pub
```{{exec}}


You are ready to head to the next part of the lab.

</details>
