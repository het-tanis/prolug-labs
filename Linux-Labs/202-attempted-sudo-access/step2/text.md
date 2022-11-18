The one user that is supposed to exist is realuser. 

Create a realuser account on both systems.

Ensure that root can log in as that user. 

Now, we may not always do this activity like this in the enterprise, but the pieces are valuable to understand.

<br>

### Solution
<details>
<summary>Solution</summary>
Check if the user exists on both servers

```plain
id realuser
ssh node01 'id realuser'
```{{exec}}

So we see that realuser exists on controlplane but the user was not created on node01. Let's create it.

```plain
ssh node01 'useradd -m realuser'
```{{exec}}

We normally wouldn't do this part, as some LDAP or outside authority would give the user password, but we'll do it for now to be able to establish connection.

```plain
ssh node01
```{{exec}}

Create a password 1234 (I know, super secure, but useful for lab testing)

```plain
passwd realuser
```{{exec}}

You will have to hit enter twice

Be sure to exit back to the controlplane node
```plain
exit
```{{exec}}

Clear the old entries

```plain
ssh node01 'echo "" > /var/log/auth.log'
```{{exec}}

Rerun the script /root/ssh_script and then check the invalid users from node01. This should take ~25 seconds.

```plain
/root/ssh_script.sh
```{{exec}}

Recheck for Invalid users. You should no longer see realuser in invalid users.

```plain
ssh node01 'grep Invalid /var/log/auth.log'
```{{exec}}

You'll still see errors with the login, but now at least the realuser is no longer Invalid. We'll fix their login in the next section.

</details>