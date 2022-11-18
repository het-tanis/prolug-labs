Your Security Operations team has informed you that an alert for sudo activity has happened on a server. Investigate the sudo logs and see what the user is attempting to do.

<br>

### Solution
<details>
<summary>Solution</summary>
User logging may take up to 60 seconds to execute and populate the logs for this. If you cannot easily wait 60 seconds, push this command

```plain
echo "I am patient and can wait 60 seconds"
sleep 60
```{{exec}}

Check the logs where Ubuntu keeps sudo requests. They may take up to 60 seconds to populate with the bad sudo requests.

```plain
tail -20 /var/log/auth.log
```{{exec}}

Also check 

```plain
tail -20 /var/log/syslog
```{{exec}}

You can search all the logs for baduser like this as well.

```plain
grep baduser /var/log/*
```{{exec}}

You will eventually see the line 
```plain
baduser : user NOT in sudoers
```
and that is how you know you can continue with lab.

So far you've activated a user account that root is using to attempt bad commands every minute.

To see root's crontab and how we're causing all the failed sudo attempts, use this command:

```plain
crontab -l
```{{exec}}
 
</details>