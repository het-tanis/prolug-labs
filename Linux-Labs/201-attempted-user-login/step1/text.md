Your Security Operations team has informed you that an alert for unknown users has gone off for your node01 instance.

Connect to the other server (node01) and look at the appropriate log to determine login attempts. 

Add the usernames into a file called /root/users.

Add the number of attempted logins into a file called /root/attempts. 

<br>

### Solution
<details>
<summary>Solution</summary>
Connect to node01

```plain
ssh node01
```{{exec}}

Verify connection attempts from /var/log/auth.log file.

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