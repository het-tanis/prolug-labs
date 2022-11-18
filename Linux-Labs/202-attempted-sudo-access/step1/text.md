Your Security Operations team has informed you that an alert for sudo activity has happened on a server. Investigate the sudo logs and see what the user is attempting to do.

<br>

### Solution
<details>
<summary>Solution</summary>
Let's give baduser a password so their account is active.

```plain
passwd baduser
```{{exec}}

Give them the password 1234 . You must enter it twice.

Check the logs where Ubuntu keeps sudo requests. They may take up to 

```plain
tail -20 /var/log/auth.log
```{{exec}}

Connect 

```plain
tail -20 /var/log/auth.log
```{{exec}}

What are the invalid users? Once you've looked at this log you can probably parse it down some

```plain
grep Invalid /var/log/auth.log
```{{exec}}

Send the usernames into the file /root/users on controlplane node

Be sure to exit back to the controlplane node
```plain
exit
```{{exec}}

```plain
ssh node01 'grep Invalid /var/log/auth.log' > /root/users
```{{exec}}

How many total failed logins were there? Write that out to /root/attempts

```plain
echo 4 > /root/attempts
```{{exec}}
 
</details>