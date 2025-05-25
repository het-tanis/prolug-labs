So far you have enabled rsyslog collection on controlplane on TCP Port 6514. 

Now you must configure the node01 server to securely send logs over the correct port.

<br>

### Solution
<details>
<summary>Solution</summary>
ssh to node01

```plain
ssh node01
```{{exec}}

Configure rsyslog

```plain
vi /etc/rsyslog.conf
```{{exec}}

Add this to the bottom of the file.

```plain
############################
# Custom TLS Client
############################

global(DefaultNetstreamDriverCAFile="/usr/local/share/ca-certificates/ca.pem")

action(type="omfwd" protocol="tcp" target="controlplane" port="6514" StreamDriver="gtls" StreamDriverMode="1" StreamDriverAuthMode="anon")

*.* @@controlplane:6514
```

Restart the service

```plain
systemctl restart rsyslog
```{{exec}}

Create a user

```plain
useradd -m someuser
```{{exec}}

Exit back to controlplane

```plain
exit
```{{exec}}

Verify that the node01 system logs are being pushed over to controlplane

```plain
grep someuser /var/log/*
```{{exec}}

Where did the logs land for the user that was created?

If you see the logs in the correct location from the node01 server you have sent logs over TLS from node01 to controlplane.

</details>
