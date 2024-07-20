So far you have enabled rsyslog collection on controlplane and sent logs to controlplane on UDP port 514 from node01. 

Your team has decided that they would like to break up the logs into more manageable pieces.

Break the log collection up into a directory for each node. Use /var/log/hostname/messages.log

Verify that the logs are being written correctly for controlplane and node01.


<br>

### Solution
<details>
<summary>Solution</summary>
Create a log filter on controlplane

```plain
vi /etc/rsyslog.d/30-remote.conf
```{{exec}}

Add the following lines to your new file.

```plain
$template RemoteLogs,"/var/log/%HOSTNAME%/messages.log"
if ($fromhost-ip != "127.0.0.1") then ?RemoteLogs
& stop
```

Restart the rsyslog service on controlplane

```plain
systemctl restart rsyslog
```{{exec}}

Verify that the logs from node01 are going to the correct place. Now that you've sent them to a new location.

```plain
tail -f /var/log/node01/messages.log
```{{exec}}

Hit ctrl + c to quit that tail of the file.

Verify that the controlplane logs are still going to the correct place.

```plain
tail -f /var/log/syslog
```{{exec}}

Hit ctrl + c to quit that tail of the file.

</details>
