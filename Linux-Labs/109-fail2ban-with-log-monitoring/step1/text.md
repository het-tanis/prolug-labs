Your team is testing fail2ban to protect the sshd process in your server. You have decide to build a proof of concept (POC) of the system and tie it into your Grafana monitoring solution.

<br>

### Solution
<details>
<summary>Solution</summary>
  
Install fail2ban

```plain
apt install -y fail2ban
```{{exec}}

Verify the version number of fail2ban client

```plain
fail2ban-client --version
```{{exec}}

```plain
vi /etc/fail2ban/jail.conf
```{{exec}}

#Uncomment [sshd] and enter the following lines under [sshd] section
    [sshd]
     enabled = true
     maxretry =  5
     findtime = 10
     bantime = 4h

#Check the rest of the file and ensure that there is no [sshd] config later in the file, delete or comment it out.

Review the configurations for apache and nginx to see what other types of jails are available in fail2ban.

Restart the service and verify that it is running properly.

```plain
systemctl restart fail2ban
```{{exec}}

```plain
systemctl status fail2ban
```{{exec}}

Test the fail2ban is properly working by trying to connect back to the controlplane server from node01 as a fake account.

```plain
ssh node01
```{{exec}}

Run a for loop and keep trying to connect back to controlplane. You will have to hit enter on each password line until lockout occurs.

```plain
for i in {1..6}; do ssh invaliduser@controlplane; done
```{{exec}}

You will have to hit 'ctrl + c' to exit when it stops trying to connect to the far end.

Exit back to controlplane and check the logs and fail status.

Check the log of fail2ban

```plain
tail -20 /var/log/fail2ban.log
```{{exec}}

Verify that you see the banned IP.

```plain
fail2ban-client get sshd banned
```{{exec}}

Do you see the IP address that you expect? Why do you think that is?

Unban the ip address from the logs. You must manually enter the correct IP address below from the upper output

```plain
faile2ban-client set sshd unban <the IP from the logs>
```

Test that the unban has happened correctly.

```plain
ssh node01
```{{exec}}

Try to connect back to controlplane with a correct user, the root user.

```plain
ssh controlplane
```{{exec}}

Did you connect back correctly? If so, move on to the next part of the lab.

</details>
