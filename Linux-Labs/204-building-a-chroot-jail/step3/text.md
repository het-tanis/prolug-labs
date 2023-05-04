We believe we have all the correct pieces in place, but now we need test that the user has capabilities we've given them and only those capabilities.

<br>

### Solution
<details>
<summary>Solution</summary>
Create user to test ssh is running in the environment.

```plain
useradd -m jailed
```{{exec}}

```plain
passwd jailed
```{{exec}}

Set password to something easy like 12345678

Jail your user and perform a curl test

```plain
chroot /var/chroot
```{{exec}}

```plain
curl www.google.com
```{{exec}}

Does this work? Why or why not? Can you curl to yahoo.com? Check your /etc/hosts and /var/chroot/etc/hosts to see why that is. Do you get DNS resolution in the jail as we set it up?

Exit the jail.

```plain
exit
```{{exec}}

Jail your user again and run a ssh test

```plain
chroot /var/chroot
```{{exec}}

```
ssh -l jailed 127.0.0.1
```{{exec}}

Enter the password and then verify that you're in the correct user. Are you still jailed? Exit out and see if your original user is still jailed. How do you exit that jail?

Hit submit to finish this lab.

</details>