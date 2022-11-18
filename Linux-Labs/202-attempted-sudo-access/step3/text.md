We've given the user ALL commands with sudo, but typically this isn't the correct solution. The rule of least privilege states we should only give the permissions they need to complete their job.

Limit the user down to only the permissions they need.

<br>

### Solution
<details>
<summary>Solution</summary>
Remove the user from the sudo group

```plain
usermod -G baduser baduser
```{{exec}}

Verify that baduser is no longer in sudo group

```plain
grep sudo /etc/group
```{{exec}}

The logs will start to show that the user is NOT in sudoers again.

So we can create a file in /etc/sudoers.d/ to give permissions to just the baduser with just the commands they need.

```plain
echo "baduser ALL=(ALL) NOPASSWD:/usr/bin/ls /root,/usr/bin/su -" > /etc/sudoers.d/baduser
```{{exec}}

If you're wondering where we found those paths, this is how we find where paths to commands are

```plain
which su
which ls
```{{exec}}

Verify sudo permisions for that user are scoped down properly
```plain
sudo -l -U baduser
```{{exec}}

How do these permissions compare with what was given when the baduser was just put in the sudo group. Why might this type of permission be more secure, but harder to maintain? If you've used ansible, how might Ansible help deploy permissions to /etc/sudoers.d/ ?

</details>